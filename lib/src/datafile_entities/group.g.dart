// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    json['id'] as String,
    json['policy'] as String,
    (json['trafficAllocation'] as List)
        ?.map((e) => e == null
            ? null
            : TrafficAllocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['experiments'] as List)
        ?.map((e) =>
            e == null ? null : Experiment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'policy': instance.policy,
      'trafficAllocation': instance.trafficAllocation,
      'experiments': instance.experiments,
    };
