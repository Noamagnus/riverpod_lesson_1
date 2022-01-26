// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_fixed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExerciseFixed _$$_ExerciseFixedFromJson(Map<String, dynamic> json) =>
    _$_ExerciseFixed(
      name: json['name'] as String?,
      estimatedTime: json['estimatedTime'] as int,
      continueOnFinish: json['continueOnFinish'] as bool? ?? false,
      reps: json['reps'] as int?,
      imageUrl: json['imageUrl'] as String?,
      props: json['props'] as String?,
      exerciseFixedState: $enumDecodeNullable(
              _$ExerciseFixedStateEnumMap, json['exerciseFixedState']) ??
          ExerciseFixedState.stop,
      displayDetails: json['displayDetails'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ExerciseFixedToJson(_$_ExerciseFixed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'estimatedTime': instance.estimatedTime,
      'continueOnFinish': instance.continueOnFinish,
      'reps': instance.reps,
      'imageUrl': instance.imageUrl,
      'props': instance.props,
      'exerciseFixedState':
          _$ExerciseFixedStateEnumMap[instance.exerciseFixedState],
      'displayDetails': instance.displayDetails,
    };

const _$ExerciseFixedStateEnumMap = {
  ExerciseFixedState.keepRunning: 'keepRunning',
  ExerciseFixedState.stop: 'stop',
};
