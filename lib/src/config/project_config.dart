import 'package:optimizely/src/datafile_entities/event.dart';
import 'package:optimizely/src/entities/entities.dart';

abstract class ProjectConfig {
  String getAccountID();
  bool getAnonymizeIP();
  String getAttributeID(String key);
  Attribute getAttributeByKey(String key);
  Audience getAudienceByID(String id);
  Map<String, Audience> getAudienceMap();
  bool getBotFiltering();
  Event getEventByKey(String key);
  Experiment getExperimentByKey(String key);
  Feature getFeatureByKey(String key);
  Variable getVariableByKey(String featureKey, String variableKey);
  List<Experiment> getExperimentList();
  List<Feature> getFeatureList();
  Group getGroupByID(String id);
  String getProjectID();
  String getRevision();
}
