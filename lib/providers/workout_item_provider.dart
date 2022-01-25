// ignore_for_file: unused_import

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_fixed_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/rest_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:uuid/uuid.dart';

//! This provider and notifirer is used when creatig WorkoutItem
//! and is cached in memory and only saved to storage when clicked save button
//! Workout item has 3 nullable fields that holds three different objects
//! Rest, Exercise and ExerciseFixed
Uuid uuid = const Uuid();
final workoutItemProvider =
    StateNotifierProvider.autoDispose<WorkoutItemStateNotifier, WorkoutItem>((ref) {
  return WorkoutItemStateNotifier(ref);
});

class WorkoutItemStateNotifier extends StateNotifier<WorkoutItem> {
  WorkoutItemStateNotifier(this.ref) : super(WorkoutItem(uuid: uuid.v4()));
  Ref ref;
  WorkoutItem getWorkoutItem() {
    return state;
  }
// This sets WorkoutItem as a Rest and saves it to workoutProviders list
  void setRest(Rest rest) {
    state = state.copyWith(
      rest: rest,
      workoutItemState: WorkoutItemState.rest,
    );
    ref.read(workoutProvider.notifier).addWorkoutItem(state);
  }
// This sets WorkoutItem as a ExerciseFixed and saves it to workoutProviders list

  void setAndAddExerciseFixed(ExerciseFixed exerciseFixed) {
    state = state.copyWith(
      exerciseFixed: exerciseFixed,
      workoutItemState: WorkoutItemState.exerciseFixed,
    );
    ref.read(workoutProvider.notifier).addWorkoutItem(state);
  }
// This sets WorkoutItem as a Exercise and saves it to workoutProviders list

  void setAndAddExercise(Exercise exercise) {
    state = state.copyWith(
      exercise: exercise,
      workoutItemState: WorkoutItemState.exercise,
    );
    ref.read(workoutProvider.notifier).addWorkoutItem(state); // adds it to workoutProvider
  }
}
