import 'package:json_annotation/json_annotation.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';

part 'workout_model.freezed.dart';
part 'workout_model.g.dart';

@freezed
class Workout with _$Workout {
  const Workout._();
  @JsonSerializable(explicitToJson: true)
  const factory Workout({
    String? name,
    @Default([]) List<WorkoutItem> workoutItems,
    @Default(false) bool showDetails,
    @Default(0) int workoutStep,
    required String uuid,
    String? description,
    @Default(WorkoutState.initial)WorkoutState workoutState,
    @Default(0) int timerDuration,
  }) = _Workout;
  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
}

enum WorkoutState{
  initial, running, paused, finished,
}