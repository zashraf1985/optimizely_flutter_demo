// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datafile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datafile _$DatafileFromJson(Map<String, dynamic> json) {
  return Datafile(
    (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['audiences'] as List)
        ?.map((e) =>
            e == null ? null : Audience.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['experiments'] as List)
        ?.map((e) =>
            e == null ? null : Experiment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['groups'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['featureFlags'] as List)
        ?.map((e) =>
            e == null ? null : FeatureFlag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['rollouts'] as List)
        ?.map((e) =>
            e == null ? null : Rollout.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['typedAudiences'] as List)
        ?.map((e) =>
            e == null ? null : Audience.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['variables'] as List)?.map((e) => e as String)?.toList(),
    json['accountId'] as String,
    json['projectId'] as String,
    json['revision'] as String,
    json['version'] as String,
    json['anonymizeIP'] as bool,
    json['botFiltering'] as bool,
  );
}

Map<String, dynamic> _$DatafileToJson(Datafile instance) => <String, dynamic>{
      'attributes': instance.attributes,
      'audiences': instance.audiences,
      'experiments': instance.experiments,
      'groups': instance.groups,
      'featureFlags': instance.featureFlags,
      'events': instance.events,
      'rollouts': instance.rollouts,
      'typedAudiences': instance.typedAudiences,
      'variables': instance.variables,
      'accountId': instance.accountId,
      'projectId': instance.projectId,
      'revision': instance.revision,
      'version': instance.version,
      'anonymizeIP': instance.anonymizeIP,
      'botFiltering': instance.botFiltering,
    };
