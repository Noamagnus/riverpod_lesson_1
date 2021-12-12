import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/StateNotifiers/timer_notifier.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';

enum ExerciseState { initial, hanging, resting, finished }

final exerciseStateNotifierProvider =
    StateNotifierProvider<ExerciseStateProvider, ExerciseState>((ref) {
  return ExerciseStateProvider(
      ref,
      const Exercise(
        reps: 3,
        hangingTime: 40,
        restingTime: 20,
      ));
});

class ExerciseStateProvider extends StateNotifier<ExerciseState> {
  final Exercise exercise;
  ExerciseStateProvider(this.ref, this.exercise) : super(ExerciseState.initial);

  Ref ref;

  void startExersicse() {
    state = ExerciseState.hanging;
    ref.read(timerProvider.notifier).start(exercise.hangingTime);
  }
}
