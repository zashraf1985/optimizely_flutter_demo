import 'package:json_annotation/json_annotation.dart';
part 'audience.g.dart';

@JsonSerializable()

// Audience represents an Audience object from the Optimizely datafile
class Audience {
  final String id;
  final String name;
  final dynamic conditions;

  Audience(this.id, this.name, this.conditions);

  factory Audience.fromJson(Map<String, dynamic> json) =>
      _$AudienceFromJson(json);

  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}
