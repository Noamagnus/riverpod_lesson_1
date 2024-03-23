// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_first_riverpod/models/exercise_model.dart';
// import 'package:my_first_riverpod/models/workout_model.dart';
// import 'package:uuid/uuid.dart';
//
// //! This provider and notifirer is used when creatig WorkoutItem
// //! and is cached in memory and only saved to storage when clicked save button
// //! Workout item has 2 nullable fields that holds three different objects
// //! Rest, Exercise and ExerciseFixed
// Uuid uuid = const Uuid();
// final workoutProvider =
//     StateNotifierProvider.autoDispose<WorkoutStateNotifier, Workout>((ref) {
//   return WorkoutStateNotifier();
// });
//
// class WorkoutStateNotifier extends StateNotifier<Workout> {
//   WorkoutStateNotifier() : super(Workout(uuid: uuid.v4()));
//
//   List<Exercise> showAllExercises() {
//     return state.listOfExercises;
//   }
//
//   void selectExerciseFromList(Workout workout) {
//     state = workout;
//   }
//
//   void setName(String value) {
//     state = state.copyWith(name: value);
//   }
//
//   //!check!!!!!!!!
//   void deleteExercise(Exercise exercise){
//         final actualList = state.listOfExercises;
//     final itemToBeDeleted = actualList.firstWhere((ex) => ex.uuid == exercise.uuid);
//     final index = actualList.indexOf(itemToBeDeleted);
//     actualList.removeAt(index);
//     state = state.copyWith(listOfExercises: actualList);
//   }
//
//   Exercise startExercise(Exercise workout) {
//     return workout;
//   }
//
//   void toggleExerciseDetails(Exercise workoutItem) {
//     final actualList = state.listOfExercises;
//     final itemToBeUpdated = actualList.firstWhere((ex) => ex.uuid == workoutItem.uuid);
//     final index = actualList.indexOf(itemToBeUpdated);
//     final updatedItem = itemToBeUpdated.copyWith(showDetails: !workoutItem.showDetails);
//     actualList.removeAt(index);
//     actualList.insert(index, updatedItem);
//
//     state = state.copyWith(listOfExercises: actualList);
//
//
//   }
//   void addExerciseRepeatersType(Exercise exercise){
//     state = state.copyWith(listOfExercises: [
//       ...state.listOfExercises, exercise.copyWith(exerciseType: ExerciseType.repeaters,)
//
//     ]);
//   }
//
//   void addExerciseFixedTimeType(Exercise exercise) {
//     state = state.copyWith(listOfExercises: [
//       ...state.listOfExercises, exercise.copyWith(exerciseType: ExerciseType.fixedTime,)
//
//     ]);
//   }
//
//   void onReorder(
//     int oldIndex,
//     int newIndex,
//   ) {
//     final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
//     final newList = state.listOfExercises;
//     final exercise = newList.removeAt(oldIndex);
//     newList.insert(newIdx, exercise);
//     state = state.copyWith(listOfExercises: newList);
//   }
// }
