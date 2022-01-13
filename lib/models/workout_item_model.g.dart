// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutItem _$$_WorkoutItemFromJson(Map<String, dynamic> json) =>
    _$_WorkoutItem(
      name: json['name'] as String?,
      uuid: json['uuid'] as String,
      workoutItemState: $enumDecodeNullable(
          _$WorkoutItemStateEnumMap, json['workoutItemState']),
      rest: json['rest'] == null
          ? null
          : Rest.fromJson(json['rest'] as Map<String, dynamic>),
      exerciseFixed: json['exerciseFixed'] == null
          ? null
          : ExerciseFixed.fromJson(
              json['exerciseFixed'] as Map<String, dynamic>),
      exercise: json['exercise'] == null
          ? null
          : Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      showDetails: json['showDetails'] as bool? ?? true,
    );

Map<String, dynamic> _$$_WorkoutItemToJson(_$_WorkoutItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'workoutItemState': _$WorkoutItemStateEnumMap[instance.workoutItemState],
      'rest': instance.rest?.toJson(),
      'exerciseFixed': instance.exerciseFixed?.toJson(),
      'exercise': instance.exercise?.toJson(),
      'showDetails': instance.showDetails,
    };

const _$WorkoutItemStateEnumMap = {
  WorkoutItemState.rest: 'rest',
  WorkoutItemState.exerciseFixed: 'exerciseFixed',
  WorkoutItemState.exercise: 'exercise',
};
