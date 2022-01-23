// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exercise _$$_ExerciseFromJson(Map<String, dynamic> json) => _$_Exercise(
      name: json['name'] as String?,
      uuid: json['uuid'] as String,
      hangingTime: json['hangingTime'] as int,
      restingTime: json['restingTime'] as int,
      reps: json['reps'] as int,
      initialReps: json['initialReps'] as int,
      exerciseState: $enumDecode(_$ExerciseStateEnumMap, json['exerciseState']),
      imageUrl: json['imageUrl'] as String?,
      displayDetails: json['displayDetails'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ExerciseToJson(_$_Exercise instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'hangingTime': instance.hangingTime,
      'restingTime': instance.restingTime,
      'reps': instance.reps,
      'initialReps': instance.initialReps,
      'exerciseState': _$ExerciseStateEnumMap[instance.exerciseState],
      'imageUrl': instance.imageUrl,
      'displayDetails': instance.displayDetails,
    };

const _$ExerciseStateEnumMap = {
  ExerciseState.initial: 'initial',
  ExerciseState.hanging: 'hanging',
  ExerciseState.resting: 'resting',
  ExerciseState.finished: 'finished',
};
