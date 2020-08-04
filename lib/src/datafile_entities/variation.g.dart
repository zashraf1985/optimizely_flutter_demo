// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variation _$VariationFromJson(Map<String, dynamic> json) {
  return Variation(
    json['id'] as String,
    json['key'] as String,
    (json['variables'] as List)
        ?.map((e) => e == null
            ? null
            : VariationVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['featureEnabled'] as bool,
  );
}

Map<String, dynamic> _$VariationToJson(Variation instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'variables': instance.variables,
      'featureEnabled': instance.featureEnabled,
    };
