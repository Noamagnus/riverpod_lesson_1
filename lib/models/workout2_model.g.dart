// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workout2 _$$_Workout2FromJson(Map<String, dynamic> json) => _$_Workout2(
      name: json['name'] as String?,
      workoutItems: (json['workoutItems'] as List<dynamic>?)
              ?.map((e) => WorkoutItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      showDetails: json['showDetails'] as bool? ?? false,
      uuid: json['uuid'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_Workout2ToJson(_$_Workout2 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workoutItems': instance.workoutItems.map((e) => e.toJson()).toList(),
      'showDetails': instance.showDetails,
      'uuid': instance.uuid,
      'description': instance.description,
    };
