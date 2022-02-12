// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exercise _$$_ExerciseFromJson(Map<String, dynamic> json) => _$_Exercise(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String,
      imageUrl: json['imageUrl'] as String?,
      prepareTime: json['prepareTime'] as int? ?? 0,
      hangingTime: json['hangingTime'] as int? ?? 0,
      restingTime: json['restingTime'] as int? ?? 0,
      reps: json['reps'] as int? ?? 1,
      initialReps: json['initialReps'] as int?,
      restAfterExercise: json['restAfterExercise'] as int? ?? 0,
      exerciseState: $enumDecode(_$ExerciseStateEnumMap, json['exerciseState']),
      exerciseType: $enumDecode(_$ExerciseTypeEnumMap, json['exerciseType']),
      estimatedTime: json['estimatedTime'] as int? ?? 1,
      startAfterFinish: json['startAfterFinish'] as bool? ?? false,
      showDetails: json['showDetails'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ExerciseToJson(_$_Exercise instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'imageUrl': instance.imageUrl,
      'prepareTime': instance.prepareTime,
      'hangingTime': instance.hangingTime,
      'restingTime': instance.restingTime,
      'reps': instance.reps,
      'initialReps': instance.initialReps,
      'restAfterExercise': instance.restAfterExercise,
      'exerciseState': _$ExerciseStateEnumMap[instance.exerciseState],
      'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType],
      'estimatedTime': instance.estimatedTime,
      'startAfterFinish': instance.startAfterFinish,
      'showDetails': instance.showDetails,
    };

const _$ExerciseStateEnumMap = {
  ExerciseState.initial: 'initial',
  ExerciseState.hanging: 'hanging',
  ExerciseState.resting: 'resting',
  ExerciseState.finished: 'finished',
  ExerciseState.restingAfter: 'restingAfter',
};

const _$ExerciseTypeEnumMap = {
  ExerciseType.repeaters: 'repeaters',
  ExerciseType.tabata: 'tabata',
  ExerciseType.fixedTime: 'fixedTime',
  ExerciseType.campus: 'campus',
  ExerciseType.system: 'system',
  ExerciseType.boulder: 'boulder',
  ExerciseType.fingerboard: 'fingerboard',
};
