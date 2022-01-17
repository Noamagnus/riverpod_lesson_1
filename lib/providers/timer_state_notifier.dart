import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exerciseNotifierProvider.dart';
import 'package:my_first_riverpod/providers/selectedWorkout_provider.dart';
import 'package:my_first_riverpod/repositiries/workout2DAO.dart';

final timerProvider = StateNotifierProvider<TimerStateNotifier, TimerModel>((ref) {
  final workout = ref.watch(selectedWorkoutNotifierProvider);

  // final workout = ref.watch(workoutDAOProvider).getAllWorkouts();
  return TimerStateNotifier(workout);
});

//!TimerStateNotifier is managing state of the TimerModel
//!Timer should not think of a exercise state ist should only think of
//!a hanging/resting parameters from Exercise
class TimerStateNotifier extends StateNotifier<TimerModel> {
  // String initial;
  TimerStateNotifier(this.workout)
      : super(TimerModel(
          _durationString(workout.workoutItems[0].exercise!.hangingTime),
          TimerState.initial,
          TimerExerciseState.hangTime,
          workout.workoutItems[0].exercise!.reps,
          0,
        ));
  Workout workout;
  var exerciseIndex = 0;

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

//! Public
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
      state = TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.hangTime,
          state.reps, state.exerciseFromList);
    } else if (state.timerExerciseState == TimerExerciseState.restTime) {
      state = TimerModel(state.timeLeft, TimerState.started, TimerExerciseState.restTime,
          state.reps, state.exerciseFromList);
    }
  }

//! Private
  void _startTimer() {
    _tickerSubscription?.cancel();

    Exercise exercise = workout.workoutItems[0].exercise!;

    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      _tickerSubscription =
          _ticker.tickerClassStream(ticks: exercise.hangingTime).listen((duration) {
        state = TimerModel(
          _durationString(duration),
          TimerState.started,
          TimerExerciseState.hangTime,
          state.reps,
          state.exerciseFromList,
        );
      });
    } else if (state.timerExerciseState == TimerExerciseState.restTime) {
      _tickerSubscription =
          _ticker.tickerClassStream(ticks: exercise.restingTime).listen((duration) {
        state = TimerModel(
          _durationString(duration),
          TimerState.started,
          TimerExerciseState.restTime,
          state.reps,
          state.exerciseFromList,
        );
      });
    }

    _tickerSubscription?.onDone(() {
      if (state.timerExerciseState == TimerExerciseState.hangTime) {
        state = TimerModel(
          state.timeLeft,
          TimerState.started,
          TimerExerciseState.restTime,
          state.reps,
          state.exerciseFromList,
        );
        _startTimer();
        return;
      }

      // if (state.timerExerciseState == TimerExerciseState.restTime) {
      //   state = TimerModel(state.timeLeft, TimerState.finished, TimerExerciseState.hangTime,
      //       state.reps - 1, state.exerciseFromList);
      //   if (state.reps > 0) {
      //     _startTimer();
      //   } else if (workout.exercises.length > exerciseIndex) {
      //     exerciseIndex++;
      //     state = TimerModel(
      //         _durationString(workout.exercises[exerciseIndex].hangingTime),
      //         TimerState.finished,
      //         TimerExerciseState.hangTime,
      //         workout.exercises[exerciseIndex].reps,
      //         state.exerciseFromList + 1);
      //     _startTimer();
      //   } else {
      //     return;
      //   }
      // }
    });

    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state = TimerModel(
        state.timeLeft,
        TimerState.started,
        TimerExerciseState.hangTime,
        state.reps,
        state.exerciseFromList,
      );
    } else if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state = TimerModel(
        state.timeLeft,
        TimerState.started,
        TimerExerciseState.restTime,
        state.reps,
        state.exerciseFromList,
      );
    }
  }

  void pause() {
    _tickerSubscription?.pause();
    if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state = TimerModel(
        state.timeLeft,
        TimerState.paused,
        TimerExerciseState.hangTime,
        state.reps,
        state.exerciseFromList,
      );
    } else if (state.timerExerciseState == TimerExerciseState.hangTime) {
      state = TimerModel(
        state.timeLeft,
        TimerState.paused,
        TimerExerciseState.restTime,
        state.reps,
        state.exerciseFromList,
      );
    }
  }

  void reset() {
    _tickerSubscription?.cancel();
    exerciseIndex = 0;
    Exercise? exercise = workout.workoutItems[0].exercise;
    state = TimerModel(
      _durationString(exercise!.hangingTime),
      TimerState.initial,
      TimerExerciseState.hangTime,
      exercise.reps,
      0,
    );
  }
}

class Ticker {
  var player = AudioCache();

  Stream<int> tickerClassStream({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) {
        var timesToTick = ticks - x - 1;
        if (timesToTick < 3 && timesToTick > 0) {
          _playSound('pip.mp3');
        }
        if (timesToTick == 0) {
          _playSound('endbeep.mp3');
          

        }
        return ticks - x - 1;
      },
    ).take(ticks);
  }

  void _playSound(String mp3) async {
    await player.play(mp3, mode: PlayerMode.LOW_LATENCY);
  }
}
