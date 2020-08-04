import 'package:json_annotation/json_annotation.dart';
import 'package:optimizely/src/datafile_entities/experiment.dart';
import 'package:optimizely/src/datafile_entities/trafficallocation.dart';
part 'group.g.dart';

@JsonSerializable()

// Group represents an Group object from the Optimizely datafile
class Group {
  final String id;
  final String policy;
  final List<TrafficAllocation> trafficAllocation;
  final List<Experiment> experiments;

  Group(this.id, this.policy, this.trafficAllocation, this.experiments);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
