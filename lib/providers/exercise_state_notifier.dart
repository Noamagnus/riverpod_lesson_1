import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/timer_notifier.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

enum ExerciseState { initial, hanging, resting, finished }






class ExerciseStateProvider extends StateNotifier<ExerciseState> {
  final Exercise exercise;
  ExerciseStateProvider(this.ref, this.exercise) : super(ExerciseState.initial);

  Ref ref;

  void startExersicse() {
    if (state == ExerciseState.initial) {
      state = ExerciseState.hanging;
      ref.read(timerProvider.notifier).start(exercise.hangingTime);
    } else if (state == ExerciseState.hanging) {
      state = ExerciseState.resting;
      ref.read(timerProvider.notifier).start(exercise.restingTime);
    }
  }

  void start2(ExerciseState step) {
    switch (step) {
      case ExerciseState.hanging:
        return ref.read(timerProvider.notifier).start(exercise.hangingTime);
      case ExerciseState.resting:
        return ref.read(timerProvider.notifier).start(exercise.restingTime);
      case ExerciseState.finished:
        return ref.read(timerProvider.notifier).pause();
      default:
        return;
    }
  }
}
