import 'package:json_annotation/json_annotation.dart';
import 'package:optimizely/src/datafile_entities/variable.dart';
part 'featureflag.g.dart';

@JsonSerializable()

// FeatureFlag represents a FeatureFlag object from the Optimizely datafile
class FeatureFlag {
  final String id;
  final String rolloutId;
  final String key;
  final List<String> experimentIds;
  final List<Variable> variables;

  FeatureFlag(
      this.id, this.rolloutId, this.key, this.experimentIds, this.variables);

  factory FeatureFlag.fromJson(Map<String, dynamic> json) =>
      _$FeatureFlagFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureFlagToJson(this);
}
