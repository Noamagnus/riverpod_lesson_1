import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';

final exerciseNotifierProvider =
    StateNotifierProvider<ExerciseNotifier, Exercise>((ref) => ExerciseNotifier());


// final exerciseProvider = StateProvider<Exercise>((ref) {
//   return const Exercise(
//     hangingTime: 7,
//     restingTime: 3,
//     reps: 3,
//   );
// });

final exerciseStateNotifierProvider =
    StateNotifierProvider<ExerciseStateProvider, ExerciseState>((ref) {
  return ExerciseStateProvider(
      ref,
      const Exercise(
        reps: 3,
        hangingTime: 7,
        restingTime: 3,
      ));
});

class ExerciseNotifier extends StateNotifier<Exercise> {
  ExerciseNotifier()
      : super(const Exercise(
          hangingTime: 7,
          restingTime: 3,
          reps: 3,
        ));

  void setHanginTime(int value) {
    state= state.copyWith(hangingTime: value);
  }

  void setRestingTime(int value) {
    state = state.copyWith(restingTime: value);
  }

  void setNumberOfReps(int value) {
    state = state.copyWith(reps: value);
  }
}
