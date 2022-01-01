import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
final workoutNotifierProvider = StateNotifierProvider<WorkoutStateNotifier, Workout>((ref) {
  return WorkoutStateNotifier();
});

class WorkoutStateNotifier extends StateNotifier<Workout> {
  WorkoutStateNotifier() : super(Workout(uuid: uuid.v4()));

  List<Exercise> showAllExercises() {
    return state.exercises;
  }
}
