import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout2_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exerciseNotifierProvider.dart';
import 'package:uuid/uuid.dart';

//! This provider and notifirer is used when creatig WorkoutItem
//! and is cached in memory and only saved to storage when clicked save button
//! Workout item has 2 nullable fields that holds three different objects
//! Rest, Exercise and ExerciseFixed
Uuid uuid = const Uuid();
final workout2NotifierProvider =
    StateNotifierProvider.autoDispose<Workout2StateNotifier, Workout2>((ref) {
  return Workout2StateNotifier();
});

class Workout2StateNotifier extends StateNotifier<Workout2> {
  Workout2StateNotifier() : super(Workout2(uuid: uuid.v4()));

  List<WorkoutItem> showAllWorkoutItem() {
    return state.workoutItems;
  }

  void selectWorkoutItemFromList(Workout2 workout) {
    state = workout;
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }
  void deleteWorkoutItem(WorkoutItem workoutItem){
        final actualList = state.workoutItems;
    final itemToBeDeleted = actualList.firstWhere((ex) => ex.uuid == workoutItem.uuid);
    final index = actualList.indexOf(itemToBeDeleted);
    actualList.removeAt(index);
    state = state.copyWith(workoutItems: actualList);


  }

  WorkoutItem startWorkoutItem(WorkoutItem workout) {
    return workout;
  }

  void toggleWorkoutItemDetails(WorkoutItem workoutItem) {
    final actualList = state.workoutItems;
    final itemToBeUpdated = actualList.firstWhere((ex) => ex.uuid == workoutItem.uuid);
    final index = actualList.indexOf(itemToBeUpdated);
    final updatedItem = itemToBeUpdated.copyWith(showDetails: !workoutItem.showDetails);
    actualList.removeAt(index);
    actualList.insert(index, updatedItem);

    state = state.copyWith(workoutItems: actualList);

    // for (var exerciseFromList in state.exercises) {
    //   if (exercise.uuid == exerciseFromList.uuid) {
    //     final nesto =exerciseFromList.copyWith(displayDetails: !exercise.displayDetails);
    //   }
    // }
  }
  // void addItemAsExercise(Exercise exercise){
  //   state=state.copyWith(workoutItems: )
  // }

  void addWorkoutItem(WorkoutItem workoutItem) {
    state = state.copyWith(workoutItems: [
      ...state.workoutItems,
      WorkoutItem(
        name: workoutItem.name,
        workoutItemState: workoutItem.workoutItemState,
        rest: workoutItem.rest,
        exercise: workoutItem.exercise,
        exerciseFixed: workoutItem.exerciseFixed,
        showDetails: workoutItem.showDetails,
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
    final newList = state.workoutItems;
    final item = newList.removeAt(oldIndex);
    newList.insert(newIdx, item);
    state = state.copyWith(workoutItems: newList);
  }
}
