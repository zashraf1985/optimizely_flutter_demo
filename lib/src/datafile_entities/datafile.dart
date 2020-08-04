import 'package:json_annotation/json_annotation.dart';
import 'package:optimizely/src/datafile_entities/attribute.dart';
import 'package:optimizely/src/datafile_entities/audience.dart';
import 'package:optimizely/src/datafile_entities/event.dart';
import 'package:optimizely/src/datafile_entities/experiment.dart';
import 'package:optimizely/src/datafile_entities/featureflag.dart';
import 'package:optimizely/src/datafile_entities/group.dart';
import 'package:optimizely/src/datafile_entities/rollout.dart';
part 'datafile.g.dart';

@JsonSerializable()

// Datafile represents the datafile we get from Optimizely
class Datafile {
  final List<Attribute> attributes;
  final List<Audience> audiences;
  final List<Experiment> experiments;
  final List<Group> groups;
  final List<FeatureFlag> featureFlags;
  final List<Event> events;
  final List<Rollout> rollouts;
  final List<Audience> typedAudiences;
  final List<String> variables;
  final String accountId;
  final String projectId;
  final String revision;
  final String version;
  final bool anonymizeIP;
  final bool botFiltering;

  Datafile(
      this.attributes,
      this.audiences,
      this.experiments,
      this.groups,
      this.featureFlags,
      this.events,
      this.rollouts,
      this.typedAudiences,
      this.variables,
      this.accountId,
      this.projectId,
      this.revision,
      this.version,
      this.anonymizeIP,
      this.botFiltering);

  factory Datafile.fromJson(Map<String, dynamic> json) =>
      _$DatafileFromJson(json);

  Map<String, dynamic> toJson() => _$DatafileToJson(this);
}
