// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_fixed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BreakBetweenExercises _$$_BreakBetweenExercisesFromJson(
        Map<String, dynamic> json) =>
    _$_BreakBetweenExercises(
      name: json['name'] as String,
      estimatedTime: json['estimatedTime'] as int,
      numberOfReps: json['numberOfReps'] as int?,
      imageUrl: json['imageUrl'] as String?,
      props: json['props'] as String?,
    );

Map<String, dynamic> _$$_BreakBetweenExercisesToJson(
        _$_BreakBetweenExercises instance) =>
    <String, dynamic>{
      'name': instance.name,
      'estimatedTime': instance.estimatedTime,
      'numberOfReps': instance.numberOfReps,
      'imageUrl': instance.imageUrl,
      'props': instance.props,
    };
