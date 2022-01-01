import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_model.freezed.dart';
part 'workout_model.g.dart';

@freezed
class Workout with _$Workout {
  const Workout._();
  const factory Workout({
    String? name,
    required String uuid,
    @Default([]) List<Exercise> exercises,
    String? description,
    @Default(1) int dificultyLevel,
  }) = _Workout;
  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
}

