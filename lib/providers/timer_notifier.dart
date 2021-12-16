import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';

final timerProvider = StateNotifierProvider<TimerNotifier, TimerModel>((ref) {
  final exercise = ref.watch(exerciseNotifierProvider);
  return TimerNotifier(exercise);
});

//!TimerNotifier is managing state of the TimerModel
//!Timer should not think of a exercise state ist should only think of
//!a hanging/resting parameters from Exercise
class TimerNotifier extends StateNotifier<TimerModel> {
  // String initial;
  TimerNotifier(this.exercise)
      : super(TimerModel(
          _durationString(exercise.hangingTime),
          TimerState.initial,
          TimerExerciseState.hangTime,
          exercise.reps,
        ));
  Exercise exercise;

  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;
//! This method transforms int to String
  static String _durationString(int duration) {
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }

  void start() {
    if (state.buttonState == TimerState.paused) {
      _restartTimer();
    } else {
      _startTimer();
    }
  }

  void _restartTimer() {
    _tickerSubscription?.resume();
    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state =
          TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.hangTime, state.reps);
    } else if (state.timerExerciseState == TimerExerciseState.restTime) {
      state =
          TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.restTime, state.reps);
    }
  }

  void _startTimer() {
    _tickerSubscription?.cancel();

    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      _tickerSubscription =
          _ticker.tickerClassStream(ticks: exercise.hangingTime).listen((duration) {
        state = TimerModel(
            _durationString(duration), TimerState.started, TimerExerciseState.hangTime, state.reps);
      });
    } else if (state.timerExerciseState == TimerExerciseState.restTime) {
      _tickerSubscription =
          _ticker.tickerClassStream(ticks: exercise.restingTime).listen((duration) {
        state = TimerModel(
            _durationString(duration), TimerState.started, TimerExerciseState.restTime, state.reps);
      });
    }

    _tickerSubscription?.onDone(() {
      if (state.timerExerciseState == TimerExerciseState.hangTime) {
        state =
            TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.restTime, state.reps);
        _startTimer();
        return;
      }

      if (state.timerExerciseState == TimerExerciseState.restTime) {
        state = TimerModel(
            state.timeLeft, TimerState.finished, TimerExerciseState.hangTime, state.reps - 1);
        if (state.reps > 0) {
          _startTimer();
        } else {
          return;
        }
      }
    });

    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state =
          TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.hangTime, state.reps);
    } else if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state =
          TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.restTime, state.reps);
    }
  }

  void pause() {
    _tickerSubscription?.pause();
    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state =
          TimerModel(state.timeLeft, TimerState.paused, TimerExerciseState.hangTime, state.reps);
    } else if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state =
          TimerModel(state.timeLeft, TimerState.paused, TimerExerciseState.restTime, state.reps);
    }
  }

  void reset() {
    _tickerSubscription?.cancel();
    state = TimerModel(
      _durationString(exercise.hangingTime),
      TimerState.initial,
      TimerExerciseState.hangTime,
      exercise.reps,
    );
  }
}

class Ticker {
  Stream<int> tickerClassStream({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
