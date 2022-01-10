import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:uuid/uuid.dart';

//! This provider and notifirer is used when creatig workout
//! and is cached in memory and only saved to storage when clicked save button
Uuid uuid = const Uuid();
final workoutNotifierProvider =
    StateNotifierProvider.autoDispose<WorkoutStateNotifier, Workout>((ref) {
  return WorkoutStateNotifier();
});

class WorkoutStateNotifier extends StateNotifier<Workout> {
  WorkoutStateNotifier() : super(Workout(uuid: uuid.v4()));

  List<Exercise> showAllExercises() {
    return state.exercises;
  }

  void selectWorkoutFromList(Workout workout) {
    state = workout;
  }

  Workout startWorkout(Workout workout) {
    return workout;
  }

  void toggleExerciseDetails(Exercise exercise) {
    final actualList = state.exercises;
    final itemToBeUpdated = actualList.firstWhere((ex) => ex.uuid == exercise.uuid);
    final index = actualList.indexOf(itemToBeUpdated);
    final updatedItem = itemToBeUpdated.copyWith(displayDetails: !exercise.displayDetails);
    actualList.removeAt(index);
    actualList.insert(index, updatedItem);

    state = state.copyWith(exercises: actualList);

    // for (var exerciseFromList in state.exercises) {
    //   if (exercise.uuid == exerciseFromList.uuid) {
    //     final nesto =exerciseFromList.copyWith(displayDetails: !exercise.displayDetails);
    //   }
    // }
  }

  void addExercise(Exercise exercise) {
    state = state.copyWith(exercises: [
      ...state.exercises,
      Exercise(
        name: exercise.name,
        exerciseState: ExerciseState.initial,
        hangingTime: exercise.hangingTime,
        reps: exercise.reps,
        restingTime: exercise.restingTime,
        imageUrl: exercise.imageUrl,
        uuid: uuid.v4(),
      )
    ]);
    // state.exercises.add(exercise);
  }

  void onReorder(
    int oldIndex,
    int newIndex,
  ) {
    final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final newList = state.exercises;
    final item = newList.removeAt(oldIndex);
    newList.insert(newIdx, item);
    state = state.copyWith(exercises: newList);
  }
}
