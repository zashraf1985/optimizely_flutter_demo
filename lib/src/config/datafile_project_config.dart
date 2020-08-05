import 'package:optimizely/src/datafile_entities/experiment.dart'
    as DatafileExperiment show Experiment;
import 'package:optimizely/src/datafile_entities/event.dart' as DatafileEvent
    show Event;
import 'package:optimizely/src/datafile_entities/audience.dart'
    as DatafileAudience show Audience;
import 'package:optimizely/src/config/project_config.dart';
import 'package:optimizely/src/datafile_entities/datafile.dart';
import 'package:optimizely/src/datafile_entities/event.dart';
import 'package:optimizely/src/entities/entities.dart';
import 'dart:convert';

import 'package:optimizely/src/mappers/mappers.dart';

Map<String, String> datafileVersions = {"4": ""};

class DatafileProjectConfig extends ProjectConfig {
  final String accountID;
  final String projectID;
  final String revision;
  final Map<String, String> experimentKeyToIDMap;
  final Map<String, Audience> audienceMap;
  final Map<String, Attribute> attributeMap;
  final Map<String, Event> eventMap;
  final Map<String, String> attributeKeyToIDMap;
  final Map<String, Experiment> experimentMap;
  final Map<String, Feature> featureMap;
  final Map<String, Group> groupMap;
  final Map<String, Rollout> rolloutMap;
  final bool anonymizeIP;
  final bool botFiltering;

  factory DatafileProjectConfig.fromDatafile(String jsonDatafile) {
    Datafile datafile = Datafile.fromJson(jsonDecode(jsonDatafile));
    if (datafile == null) {
      throw new Exception('Error parsing datafile');
    }

    if (!datafileVersions.containsKey(datafile.version)) {
      throw new Exception("unsupported datafile version");
    }

    List attributeMaps = mapAttributes(datafile.attributes);
    Map<String, Attribute> attributeMap = attributeMaps[0];
    Map<String, String> attributeKeyToIDMap = attributeMaps[1];
    List<DatafileExperiment.Experiment> allExperiments =
        mergeExperiments(datafile.experiments, datafile.groups);

    List groupMaps = mapGroups(datafile.groups);
    Map<String, Group> groupMap = groupMaps[0];
    Map<String, String> experimentGroupMap = groupMaps[1];

    List experimentMaps = mapExperiments(allExperiments, experimentGroupMap);
    Map<String, Experiment> experimentMap = experimentMaps[0];
    Map<String, String> experimentKeyMap = experimentMaps[1];

    Map<String, Rollout> rolloutMap = mapRollouts(datafile.rollouts);
    Map<String, DatafileEvent.Event> eventMap = mapEvents(datafile.events);

    List<DatafileAudience.Audience> mergedAudiences = [];
    if (datafile.typedAudiences != null) {
      mergedAudiences.addAll(datafile.typedAudiences);
    }
    if (datafile.audiences != null) {
      mergedAudiences.addAll(datafile.audiences);
    }

    Map<String, Feature> featureMap =
        mapFeatures(datafile.featureFlags, rolloutMap, experimentMap);

    return DatafileProjectConfig(
        datafile.accountId,
        datafile.projectId,
        datafile.revision,
        experimentKeyMap,
        mapAudiences(mergedAudiences),
        attributeMap,
        eventMap,
        attributeKeyToIDMap,
        experimentMap,
        featureMap,
        groupMap,
        rolloutMap,
        datafile.anonymizeIP,
        datafile.botFiltering);
  }

  DatafileProjectConfig(
      this.accountID,
      this.projectID,
      this.revision,
      this.experimentKeyToIDMap,
      this.audienceMap,
      this.attributeMap,
      this.eventMap,
      this.attributeKeyToIDMap,
      this.experimentMap,
      this.featureMap,
      this.groupMap,
      this.rolloutMap,
      this.anonymizeIP,
      this.botFiltering);

  @override
  String getAccountID() {
    return accountID;
  }

  @override
  bool getAnonymizeIP() {
    return anonymizeIP;
  }

  @override
  Attribute getAttributeByKey(String key) {
    String attributeID = attributeKeyToIDMap[key];
    if (attributeID != "" && attributeMap.containsKey(attributeID)) {
      return attributeMap[attributeID];
    }
    return null;
  }

  @override
  String getAttributeID(String key) {
    return attributeKeyToIDMap[key];
  }

  @override
  Audience getAudienceByID(String id) {
    return audienceMap[id];
  }

  @override
  Map<String, Audience> getAudienceMap() {
    return audienceMap;
  }

  @override
  bool getBotFiltering() {
    return botFiltering;
  }

  @override
  Event getEventByKey(String key) {
    return eventMap[key];
  }

  @override
  Experiment getExperimentByKey(String key) {
    String experimentID = experimentKeyToIDMap[key];
    if (experimentID != "" && experimentMap.containsKey(experimentID)) {
      return experimentMap[experimentID];
    }
    return null;
  }

  @override
  List<Experiment> getExperimentList() {
    List<Experiment> experimentList = [];
    experimentMap.forEach((key, value) {
      experimentList.add(value);
    });
    return experimentList;
  }

  @override
  Feature getFeatureByKey(String key) {
    return featureMap[key];
  }

  @override
  List<Feature> getFeatureList() {
    List<Feature> featureList = [];
    featureMap.forEach((key, value) {
      featureList.add(value);
    });
    return featureList;
  }

  @override
  Group getGroupByID(String id) {
    return groupMap[id];
  }

  @override
  String getProjectID() {
    return this.projectID;
  }

  @override
  String getRevision() {
    return this.revision;
  }

  @override
  Variable getVariableByKey(String featureKey, String variableKey) {
    if (featureMap.containsKey(featureKey)) {
      Feature feature = featureMap[featureKey];
      return feature.variableMap[variableKey];
    }
    return null;
  }
}
