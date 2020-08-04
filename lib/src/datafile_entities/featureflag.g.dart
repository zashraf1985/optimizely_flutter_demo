// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featureflag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureFlag _$FeatureFlagFromJson(Map<String, dynamic> json) {
  return FeatureFlag(
    json['id'] as String,
    json['rolloutId'] as String,
    json['key'] as String,
    (json['experimentIds'] as List)?.map((e) => e as String)?.toList(),
    (json['variables'] as List)
        ?.map((e) =>
            e == null ? null : Variable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeatureFlagToJson(FeatureFlag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rolloutId': instance.rolloutId,
      'key': instance.key,
      'experimentIds': instance.experimentIds,
      'variables': instance.variables,
    };
