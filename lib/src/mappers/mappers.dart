import 'package:optimizely/src/datafile_entities/attribute.dart'
    as DatafileAttribute show Attribute;
import 'package:optimizely/src/datafile_entities/experiment.dart'
    as DatafileExperiment show Experiment;
import 'package:optimizely/src/datafile_entities/group.dart' as DatafileGroup
    show Group;
import 'package:optimizely/src/datafile_entities/variation.dart'
    as DatafileVariation show Variation;
import 'package:optimizely/src/datafile_entities/rollout.dart'
    as DatafileRollout show Rollout;
import 'package:optimizely/src/datafile_entities/event.dart' as DatafileEvent
    show Event;
import 'package:optimizely/src/datafile_entities/featureflag.dart'
    as DatafileFeatureFlag show FeatureFlag;
import 'package:optimizely/src/datafile_entities/audience.dart'
    as DatafileAudience show Audience;

import 'package:optimizely/src/entities/entities.dart';

List mapAttributes(List<DatafileAttribute.Attribute> attributes) {
  Map<String, Attribute> attributeMap = {};
  Map<String, String> attributeKeyToIDMap = {};
  attributes.forEach((element) {
    if (!attributeMap.containsKey(element.id)) {
      attributeMap[element.id] = Attribute(element.id, element.key);
      attributeKeyToIDMap[element.key] = element.id;
    }
  });
  return [attributeMap, attributeKeyToIDMap];
}

List<DatafileExperiment.Experiment> mergeExperiments(
    List<DatafileExperiment.Experiment> rawExperiments,
    List<DatafileGroup.Group> rawGroups) {
  List<DatafileExperiment.Experiment> mergedExperiments = rawExperiments;
  rawGroups.forEach((element) {
    mergedExperiments.addAll(element.experiments);
  });
  return mergedExperiments;
}

List mapGroups(List<DatafileGroup.Group> rawGroups) {
  Map<String, Group> groupMap = {};
  Map<String, String> experimentGroupMap = {};

  rawGroups.forEach((group) {
    Group groupEntity = Group();
    groupEntity.id = group.id;
    groupEntity.policy = group.policy;
    groupEntity.trafficAllocation = List<Range>();

    group.trafficAllocation.forEach((traffic) {
      Range range = Range();
      range.entityID = traffic.entityId;
      range.endOfRange = traffic.endOfRange;
      groupEntity.trafficAllocation.add(range);
    });
    groupMap[group.id] = groupEntity;
    group.experiments.forEach((experiment) {
      experimentGroupMap[experiment.id] = group.id;
    });
  });
  return [groupMap, experimentGroupMap];
}

List mapExperiments(List<DatafileExperiment.Experiment> rawExperiments,
    Map<String, String> experimentGroupMap) {
  Map<String, Experiment> experimentMap = {};
  Map<String, String> experimentKeyMap = {};

  rawExperiments.forEach((rawExperiment) {
    Experiment exp = mapExperiment(rawExperiment);
    exp.groupID = experimentGroupMap[exp.id];
    experimentMap[exp.id] = exp;
    experimentKeyMap[exp.key] = exp.id;
  });
  return [experimentMap, experimentKeyMap];
}

Map<String, Rollout> mapRollouts(List<DatafileRollout.Rollout> rollouts) {
  Map<String, Rollout> rolloutMap = {};
  rollouts.forEach((rollout) {
    rolloutMap[rollout.id] = mapRollout(rollout);
  });
  return rolloutMap;
}

Rollout mapRollout(DatafileRollout.Rollout datafileRollout) {
  List<Experiment> rolloutExperiments = [];
  datafileRollout.experiments.forEach((datafileExperiment) {
    Experiment experiment = mapExperiment(datafileExperiment);
    rolloutExperiments.add(experiment);
  });

  Rollout rollout = Rollout();
  rollout.id = datafileRollout.id;
  rollout.experiments = rolloutExperiments;
  return rollout;
}

Variation mapVariation(DatafileVariation.Variation rawVariation) {
  Variation variation = Variation();
  variation.id = rawVariation.id;
  variation.key = rawVariation.key;
  variation.featureEnabled = rawVariation.featureEnabled;
  variation.variables = {};

  rawVariation.variables.forEach((variable) {
    VariationVariable varVariable = VariationVariable();
    varVariable.id = variable.id;
    varVariable.value = variable.value;
    variation.variables[variable.id] = varVariable;
  });

  return variation;
}

Experiment mapExperiment(DatafileExperiment.Experiment rawExperiment) {
  Experiment experiment = Experiment();
  experiment.audienceIds = rawExperiment.audienceIds;
  experiment.id = rawExperiment.id;
  experiment.layerID = rawExperiment.layerId;
  experiment.key = rawExperiment.key;
  experiment.variations = Map<String, Variation>();
  experiment.variationKeyToIDMap = Map<String, String>();
  experiment.trafficAllocation = List<Range>();
  experiment.audienceConditions = rawExperiment.audienceConditions;
  experiment.whitelist = rawExperiment.forcedVariations;
  experiment.isFeatureExperiment = false;

  rawExperiment.variations.forEach((variation) {
    experiment.variations[variation.id] = mapVariation(variation);
    experiment.variationKeyToIDMap[variation.key] = variation.id;
  });

  rawExperiment.trafficAllocation.forEach((traffic) {
    Range range = Range();
    range.entityID = traffic.entityId;
    range.endOfRange = traffic.endOfRange;
    experiment.trafficAllocation.add(range);
  });

  return experiment;
}

Map<String, DatafileEvent.Event> mapEvents(List<DatafileEvent.Event> events) {
  Map<String, DatafileEvent.Event> eventMap = {};
  events.forEach((event) {
    DatafileEvent.Event entityEvent =
        DatafileEvent.Event(event.id, event.key, event.experimentIds);
    eventMap[entityEvent.key] = entityEvent;
  });
  return eventMap;
}

Map<String, Feature> mapFeatures(
    List<DatafileFeatureFlag.FeatureFlag> featureFlags,
    Map<String, Rollout> rolloutMap,
    Map<String, Experiment> experimentMap) {
  Map<String, Feature> featureMap = {};
  featureFlags.forEach((featureFlag) {
    Feature feature = Feature();
    feature.key = featureFlag.key;
    feature.id = featureFlag.id;

    if (rolloutMap.containsKey(featureFlag.rolloutId)) {
      feature.rollout = rolloutMap[featureFlag.rolloutId];
    }
    List<Experiment> featureExperiments = [];
    featureFlag.experimentIds.forEach((experimentID) {
      if (experimentMap.containsKey(experimentID)) {
        Experiment experiment = experimentMap[experimentID];
        experiment.isFeatureExperiment = true;
        featureExperiments.add(experiment);
        experimentMap[experimentID] = experiment;
      }

      Map<String, Variable> variableMap = {};
      featureFlag.variables.forEach((variable) {
        String realType = variable.type;
        if (variable.type == "string" && variable.subType == "json") {
          realType = "string";
        }

        Variable v = Variable();
        v.defaultValue = variable.defaultValue;
        v.id = variable.id;
        v.key = variable.key;
        v.type = realType;
        variableMap[variable.key] = v;
      });
      feature.featureExperiments = featureExperiments;
      feature.variableMap = variableMap;
      featureMap[featureFlag.key] = feature;
    });
  });
  return featureMap;
}

Map<String, Audience> mapAudiences(List<DatafileAudience.Audience> audiences) {
  Map<String, Audience> audienceMap = {};
  audiences.forEach((audience) {
    if (!audienceMap.containsKey(audience.id)) {
      Audience tmpAudience = Audience();
      tmpAudience.id = audience.id;
      tmpAudience.name = audience.name;
      tmpAudience.conditions = audience.conditions;
    }
  });
  return audienceMap;
}
