
import 'package:freezed_annotation/freezed_annotation.dart';
part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class Exercise with _$Exercise {
  const Exercise._();
  const factory Exercise({
    @Default('')String name,
    required String uuid,
    String? imageUrl,
    @Default(0)int prepareTime,
    @Default(0)int hangingTime,
    @Default(0)int restingTime,
    @Default(1)int reps,
    int? initialReps,
    @Default(0)int restAfterExercise,
    required ExerciseState exerciseState,
    required ExerciseType exerciseType,
    @Default(1)int estimatedTime,
    @Default(false) bool startAfterFinish,
    @Default(true) bool showDetails,
  }) = _Exercise;
  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
}

enum ExerciseState {
  initial,
  hanging,
  resting,
  finished,
  restingAfter,
}

enum ExerciseType {
  repeaters,
  tabata,
  fixedTime,
  campus,
  system,
  boulder,
  fingerboard,
}
