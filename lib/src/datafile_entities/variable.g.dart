// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return Variable(
    json['defaultValue'] as String,
    json['id'] as String,
    json['key'] as String,
    json['type'] as String,
    json['subType'] as String,
  );
}

Map<String, dynamic> _$VariableToJson(Variable instance) => <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'id': instance.id,
      'key': instance.key,
      'type': instance.type,
      'subType': instance.subType,
    };
