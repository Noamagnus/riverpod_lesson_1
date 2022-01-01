// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workout _$$_WorkoutFromJson(Map<String, dynamic> json) => _$_Workout(
      name: json['name'] as String?,
      uuid: json['uuid'] as String,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
      dificultyLevel: json['dificultyLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_WorkoutToJson(_$_Workout instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'exercises': instance.exercises,
      'description': instance.description,
      'dificultyLevel': instance.dificultyLevel,
    };
