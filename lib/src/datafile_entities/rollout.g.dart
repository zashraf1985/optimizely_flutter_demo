// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rollout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rollout _$RolloutFromJson(Map<String, dynamic> json) {
  return Rollout(
    json['id'] as String,
    (json['experiments'] as List)
        ?.map((e) =>
            e == null ? null : Experiment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RolloutToJson(Rollout instance) => <String, dynamic>{
      'id': instance.id,
      'experiments': instance.experiments,
    };
