// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experiment _$ExperimentFromJson(Map<String, dynamic> json) {
  return Experiment(
    json['id'] as String,
    json['key'] as String,
    json['layerId'] as String,
    json['status'] as String,
    (json['variations'] as List)
        ?.map((e) =>
            e == null ? null : Variation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['trafficAllocation'] as List)
        ?.map((e) => e == null
            ? null
            : TrafficAllocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['audienceIds'] as List)?.map((e) => e as String)?.toList(),
    (json['forcedVariations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['audienceConditions'],
  );
}

Map<String, dynamic> _$ExperimentToJson(Experiment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'layerId': instance.layerId,
      'status': instance.status,
      'variations': instance.variations,
      'trafficAllocation': instance.trafficAllocation,
      'audienceIds': instance.audienceIds,
      'forcedVariations': instance.forcedVariations,
      'audienceConditions': instance.audienceConditions,
    };
