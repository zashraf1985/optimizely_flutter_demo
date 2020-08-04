import 'package:json_annotation/json_annotation.dart';
import 'package:optimizely/src/datafile_entities/experiment.dart';
part 'rollout.g.dart';

@JsonSerializable()

// Rollout represents a rollout from the Optimizely datafile
class Rollout {
  final String id;
  final List<Experiment> experiments;

  Rollout(this.id, this.experiments);

  factory Rollout.fromJson(Map<String, dynamic> json) =>
      _$RolloutFromJson(json);

  Map<String, dynamic> toJson() => _$RolloutToJson(this);
}
