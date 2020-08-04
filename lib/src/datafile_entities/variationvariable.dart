import 'package:json_annotation/json_annotation.dart';
part 'variationvariable.g.dart';

@JsonSerializable()

// VariationVariable represents a Variable object from the Variation
class VariationVariable {
  final String id;
  final String value;

  VariationVariable(this.id, this.value);

  factory VariationVariable.fromJson(Map<String, dynamic> json) =>
      _$VariationVariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariationVariableToJson(this);
}
