import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';


enum ExerciseState { initial, hanging, resting, finished }

final exerciseNotifierProvider = StateNotifierProvider<ExerciseNotifier, Exercise>((ref) {
  return ExerciseNotifier();
});

class ExerciseNotifier extends StateNotifier<Exercise> {
  ExerciseNotifier()
      : super(const Exercise(
          hangingTime: 8,
          restingTime: 7,
          
          reps: 2,
          exerciseState: ExerciseState.initial,
        ));

  // TimerModel timerModel;

  void setHanginTime(int value) {
    state = state.copyWith(hangingTime: value);
  }

  void setRestingTime(int value) {
    state = state.copyWith(restingTime: value);
  }

  void setNumberOfReps(int value) {
    state = state.copyWith(reps: value);
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
