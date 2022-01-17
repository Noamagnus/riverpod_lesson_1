import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';

import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
final selectedWorkoutNotifierProvider = StateNotifierProvider<WorkoutStateNotifier, Workout>((ref) {
  return WorkoutStateNotifier();
});

class WorkoutStateNotifier extends StateNotifier<Workout> {
  WorkoutStateNotifier() : super(Workout(uuid: uuid.v4()));

  List<WorkoutItem> showAllExercises() {
    return state.workoutItems;
  }

  void selectWorkoutFromList(Workout workout) {
    state = workout;
  }

  Workout getSelectedWorkout() {
    return state;
  }

  // Workout startWorkout(Workout workout) {
  //   return workout;
  // }

}
