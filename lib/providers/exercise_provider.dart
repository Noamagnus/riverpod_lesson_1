import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/helpers/image_picker.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
enum ExerciseState { initial, hanging, resting, finished }

final exerciseProvider = StateNotifierProvider<ExerciseStateNotifier, Exercise>((ref) {
  return ExerciseStateNotifier(ref);
});

class ExerciseStateNotifier extends StateNotifier<Exercise> {
  ExerciseStateNotifier(this.ref)
      : super(Exercise(
          uuid: uuid.v4(),
          hangingTime: 7,
          restingTime: 3,
          reps: 3,
          initialReps: 3,
          exerciseState: ExerciseState.initial,
        ));
  Ref ref; //! to be able to read imagePickerProvider

  void selectExerciseFromList(Exercise exercise) {
    state = exercise;
  }
  void setName(String value) {
    state= state.copyWith(name: value);
  }

  void setHanginTime(int value) {
    state = state.copyWith(hangingTime: value);
  }

  void setRestingTime(int value) {
    state = state.copyWith(restingTime: value);
  }

  void setNumberOfReps(int value) {
    state = state.copyWith(reps: value, initialReps: value);
  }

  void takePicture() async {
    final exerciseImageUrl = await ref.read(imagePickerProvider).takePicture();
    state = state.copyWith(imageUrl: exerciseImageUrl);
  }

   void showDetails() {
    state=state.copyWith(displayDetails: !state.displayDetails);
  }
   
   
  

  // void startExersicse() {
  //   if (state.reps > 1) {
  //     if (state.exerciseState == ExerciseState.initial) {
  //      timerModel.
  //       state = state.copyWith(exerciseState: ExerciseState.hanging);
  //     } else if (state.exerciseState == ExerciseState.hanging) {

  //       state = state.copyWith(exerciseState: ExerciseState.resting);
  //       state = state.copyWith(reps: state.reps - 1);
  //     }
  //   } else {
  //     state = state.copyWith(exerciseState: ExerciseState.finished);
  //   }
  // }
  // void pauseExercise(){

  // }
  // void resetExercise(){

  // }
}
