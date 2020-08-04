import 'package:json_annotation/json_annotation.dart';
import 'package:optimizely/src/datafile_entities/variationvariable.dart';
part 'variation.g.dart';

@JsonSerializable()

// Variation represents an experiment variation from the Optimizely datafile
class Variation {
  final String id;
  final String key;
  final List<VariationVariable> variables;
  final bool featureEnabled;

  Variation(this.id, this.key, this.variables, this.featureEnabled);

  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
}
