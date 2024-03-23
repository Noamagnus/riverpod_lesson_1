// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_first_riverpod/helpers/image_picker.dart';
// import 'package:my_first_riverpod/models/exercise_model.dart';
// import 'package:uuid/uuid.dart';
//
// Uuid uuid = const Uuid();
//
// final exerciseProvider = StateNotifierProvider.autoDispose<ExerciseStateNotifier, Exercise>((ref) {
//   return ExerciseStateNotifier(ref);
// });
//
// class ExerciseStateNotifier extends StateNotifier<Exercise> {
//   ExerciseStateNotifier(this.ref)
//       : super(Exercise(
//           uuid: uuid.v4(),
//           exerciseState: ExerciseState.initial,
//           exerciseType: ExerciseType.repeaters,
//         ));
//   Ref ref; //! to be able to read imagePickerProvider
//
//   void selectExerciseFromList(Exercise exercise) {
//     state = exercise;
//   }
//
//   //! Setters
//   void setName(String value) {
//     state= state.copyWith(name: value);
//   }
//   void setPrepareTime(int value) {
//     state = state.copyWith(prepareTime: value);
//   }
//
//   void setHanginTime(int value) {
//     state = state.copyWith(hangingTime: value);
//   }
//
//   void setRestingTime(int value) {
//     state = state.copyWith(restingTime: value);
//   }
//
//   void setNumberOfReps(int value) {
//     state = state.copyWith(reps: value, initialReps: value);
//   }
//   void setRestAfter(int value) {
//     state = state.copyWith(restAfterExercise: value,);
//   }
//
//   void takePicture() async {
//     final exerciseImageUrl = await ref.read(imagePickerProvider).takePicture();
//     state = state.copyWith(imageUrl: exerciseImageUrl);
//   }
//   void setEstimatedTime(int value){
//     state = state.copyWith(estimatedTime: value);
//   }
//   void setContinueOnFinish(bool value){
//     state = state.copyWith(startAfterFinish: value);
//   }
//
//    void toggleShowDetails() {
//     state=state.copyWith(showDetails: !state.showDetails);
//   }
//
//
//
//
//   // void startExersicse() {
//   //   if (state.reps > 1) {
//   //     if (state.exerciseState == ExerciseState.initial) {
//   //      timerModel.
//   //       state = state.copyWith(exerciseState: ExerciseState.hanging);
//   //     } else if (state.exerciseState == ExerciseState.hanging) {
//
//   //       state = state.copyWith(exerciseState: ExerciseState.resting);
//   //       state = state.copyWith(reps: state.reps - 1);
//   //     }
//   //   } else {
//   //     state = state.copyWith(exerciseState: ExerciseState.finished);
//   //   }
//   // }
//   // void pauseExercise(){
//
//   // }
//   // void resetExercise(){
//
//   // }
// }
