// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workout _$$_WorkoutFromJson(Map<String, dynamic> json) => _$_Workout(
      name: json['name'] as String?,
      listOfExercises: (json['listOfExercises'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      showDetails: json['showDetails'] as bool? ?? false,
      workoutStep: json['workoutStep'] as int? ?? 0,
      uuid: json['uuid'] as String,
      description: json['description'] as String?,
      workoutState:
          $enumDecodeNullable(_$WorkoutStateEnumMap, json['workoutState']) ??
              WorkoutState.initial,
      timerDuration: json['timerDuration'] as int? ?? 0,
    );

Map<String, dynamic> _$$_WorkoutToJson(_$_Workout instance) =>
    <String, dynamic>{
      'name': instance.name,
      'listOfExercises':
          instance.listOfExercises.map((e) => e.toJson()).toList(),
      'showDetails': instance.showDetails,
      'workoutStep': instance.workoutStep,
      'uuid': instance.uuid,
      'description': instance.description,
      'workoutState': _$WorkoutStateEnumMap[instance.workoutState],
      'timerDuration': instance.timerDuration,
    };

const _$WorkoutStateEnumMap = {
  WorkoutState.initial: 'initial',
  WorkoutState.running: 'running',
  WorkoutState.paused: 'paused',
  WorkoutState.finished: 'finished',
  WorkoutState.pausedAfterExerciseFixed: 'pausedAfterExerciseFixed',
};
