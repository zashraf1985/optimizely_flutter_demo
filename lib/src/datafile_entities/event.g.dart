// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['id'] as String,
    json['key'] as String,
    (json['experimentIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'experimentIds': instance.experimentIds,
    };
