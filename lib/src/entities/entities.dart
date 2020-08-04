import 'package:optimizely/src/datafile_entities/experiment.dart';
import 'package:optimizely/src/datafile_entities/variable.dart';

class Attribute {
  String id;
  String key;
  Attribute(this.id, this.key);
}

class Audience {
  String id;
  String name;
}

class Variation {
  String id;
  Map<String, VariationVariable> variables;
  String key;
  bool featureEnabled;
}

class Experiment {
  List<String> audienceIds;
  String id;
  String layerID;
  String key;
  Map<String, Variation> variations;
  Map<String, String> variationKeyToIDMap;
  List<Range> trafficAllocation;
  String groupID;
  Map<String, String> whitelist;
  bool isFeatureExperiment;
}

class Range {
  String entityID;
  int endOfRange;
}

class VariationVariable {
  String id;
  String value;
}

class Feature {
  String id;
  String key;
  List<Experiment> featureExperiments;
  Rollout rollout;
  Map<String, Variable> variableMap;
}

class Rollout {
  String id;
  List<Experiment> experiments;
}

class Variable {
  String defaultValue;
  String id;
  String key;
  String type;
}

class Group {
  String id;
  String policy;
  List<Range> trafficAllocation;
}
