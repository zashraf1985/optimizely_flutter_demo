// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trafficallocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrafficAllocation _$TrafficAllocationFromJson(Map<String, dynamic> json) {
  return TrafficAllocation(
    json['entityId'] as String,
    json['endOfRange'] as int,
  );
}

Map<String, dynamic> _$TrafficAllocationToJson(TrafficAllocation instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'endOfRange': instance.endOfRange,
    };
