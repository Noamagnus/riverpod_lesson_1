import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_fixed_model.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/rest_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';

import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
final actionWorkoutProvider = StateNotifierProvider<WorkoutStateNotifier, Workout>((ref) {
  return WorkoutStateNotifier(ref);
});

class WorkoutStateNotifier extends StateNotifier<Workout> {
  WorkoutStateNotifier(this.ref) : super(Workout(uuid: uuid.v4()));

  Ref ref;

  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }

  List<WorkoutItem> showAllWorkoutItems() {
    return state.workoutItems;
  }

  void _startWorkout() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    _workoutItemStateCheck(workoutItem);
  }

  void _workoutItemStateCheck(WorkoutItem workoutItem) {
    switch (workoutItem.workoutItemState) {
      case WorkoutItemState.exercise:
        return _startExercise(workoutItem.exercise);
      case WorkoutItemState.rest:
        return _startRest(workoutItem.rest);
      case WorkoutItemState.exerciseFixed:
        return _startExerciseFixed(workoutItem.exerciseFixed);
    }
  }

  /// Fires if WorkoutItem is Exercise
  void _startExercise(Exercise? exercise) {
    if (exercise!.exerciseState == ExerciseState.initial ||
        exercise.exerciseState == ExerciseState.hanging) {
      _setExerciseState(ExerciseState.hanging);
      final timeToCount = exercise.hangingTime;
      _setTimeAndStart(timeToCount);
    } else if (exercise.exerciseState == ExerciseState.resting) {
      final timeToCount = exercise.restingTime;
      _setTimeAndStart(timeToCount);
    }
  }

  ///Fires when WorkoutItem is ExerciseFixed
  void _startExerciseFixed(ExerciseFixed? exerciseFixed) {
    final timeToCount = exerciseFixed!.estimatedTime;
    _setTimeAndStart(timeToCount);
  }

  /// Fires if WorkoutItem is Rest
  void _startRest(Rest? rest) {
    final timeToCount = rest!.restTime;
    _setTimeAndStart(timeToCount);
  }

  /// this one sets time for timer and starts timer
  void _setTimeAndStart(int timeToCount) {
    state = state.copyWith(timerDuration: timeToCount);
    _startTimer();
  }

//! methods regarding Exercise
  Exercise? _getExerciseFromWorkout() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    return workoutItem.exercise;
  }

  ExerciseState _getExerciseState() {
    final exercise = _getExerciseFromWorkout();
    return exercise!.exerciseState;
  }

  void _setExerciseState(ExerciseState exerciseState) {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    final exercise = workoutItem.exercise;
    final newExercise = exercise!.copyWith(exerciseState: exerciseState);
    final newWorkoutItem = workoutItem.copyWith(exercise: newExercise);
    workoutItemsList.removeAt(workoutStep);
    workoutItemsList.insert(workoutStep, newWorkoutItem);
    state = state.copyWith(workoutItems: workoutItemsList);
  }

  int _getExerciseReps() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    final exercise = workoutItem.exercise;
    return exercise!.reps;
  }

  void _setExerciseReps(int reps) {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    final exercise = workoutItem.exercise;
    final newExercise = exercise!.copyWith(reps: reps);
    final newWorkoutItem = workoutItem.copyWith(exercise: newExercise);
    workoutItemsList.removeAt(workoutStep);
    workoutItemsList.insert(workoutStep, newWorkoutItem);
    state = state.copyWith(workoutItems: workoutItemsList);
  }

//! Methotd regarding ExerciseFixed
  ExerciseFixed? getExerciseFixedFromWorkout() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    return workoutItem.exerciseFixed;
  }

  bool _getToStopOrNot() {
    final exerciseFixed = getExerciseFixedFromWorkout();
    return exerciseFixed!.continueOnFinish;
  }

  void toggleExerciseFixedOnFinish() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    final exerciseFixed = workoutItem.exerciseFixed;
    final newExerciseFixed =
        exerciseFixed!.copyWith(continueOnFinish: !exerciseFixed.continueOnFinish);
    final newWorkoutItem = workoutItem.copyWith(exerciseFixed: newExerciseFixed);
    workoutItemsList.removeAt(workoutStep);
    workoutItemsList.insert(workoutStep, newWorkoutItem);
    state = state.copyWith(workoutItems: workoutItemsList);
  }

  /// fires from TimerNotifier

  void _onTimerFinised() {
    final step = _getWorkoutStep();
    final workoutItem = state.workoutItems[step];
    switch (workoutItem.workoutItemState) {
      case WorkoutItemState.exercise:
        return _workoutItemIsExercise();
      case WorkoutItemState.rest:
        return _workoutItemIsRest();
      case WorkoutItemState.exerciseFixed:
        return _workoutItemIsExerciseFixed();
    }
  }

// Fires after timer is finished and WorkoutItem is Exercise
  void _workoutItemIsExercise() {
    final exerciseState = _getExerciseState();
    final currentReps = _getExerciseReps();
    if (exerciseState == ExerciseState.hanging) {
      _setExerciseState(ExerciseState.resting);
      _startWorkout();
    } else if (exerciseState == ExerciseState.resting && currentReps >= 2) {
      _setExerciseState(ExerciseState.hanging);
      _setExerciseReps(currentReps - 1);
      _startWorkout();
    } else {
      if (_isEnd()) {
        pauseWorkout();
      } else {
        _addWorkoutStep();
        _startWorkout();
      }
    }
  }

  // Fires after timer is finished and WorkoutItem is ExerciseFixed
  void _workoutItemIsExerciseFixed() {
    if (_isEnd()) {
      pauseWorkout();
    } else {
      if (_getToStopOrNot()) {
        pauseWorkout();
        state = state.copyWith(workoutState: WorkoutState.pausedAfterExerciseFixed);
      } else {
        _addWorkoutStep();
        _startWorkout();
      }
    }
  }

// Fires after timer is finished and WorkoutItem is Rest
  void _workoutItemIsRest() {
    if (_isEnd()) {
      pauseWorkout();
    } else {
      _addWorkoutStep();
      _startWorkout();
    }
  }

  bool _isEnd() {
    final workoutStep = _getWorkoutStep();
    final listOfWorkoutItems = state.workoutItems.length;
    return (listOfWorkoutItems - 1 == workoutStep);
  }

  //! Workout related methods
  int _getWorkoutStep() {
    return state.workoutStep;
  }

  void _addWorkoutStep() {
    final currentStep = _getWorkoutStep();
    state = state.copyWith(workoutStep: currentStep + 1);
  }

//! form here all methods is related to workout controlls
  // void startWorkout() {
  //   _startWorkout();
  //   state = state.copyWith(workoutState: WorkoutState.running);
  // }

  void startWorkout() {
    if (state.workoutState == WorkoutState.paused) {
      _restartTimer();
    } else {
      state = state.copyWith(workoutState: WorkoutState.running);
      _startWorkout();
    }
  }

  void resumeWorkoutAfterExerciseFixed() {
    _addWorkoutStep();
    _startWorkout();
  }

  void _restartTimer() {
    _tickerSubscription?.resume();
    state = state.copyWith(workoutState: WorkoutState.running);
  }

  void pauseWorkout() {
    _tickerSubscription?.pause();
    state = state.copyWith(workoutState: WorkoutState.paused);
  }

  void resetWorkout() {
    _tickerSubscription?.cancel();
    state = state.copyWith(
      workoutState: WorkoutState.initial,
    );
  }

  void selectWorkoutFromList(Workout workout) {
    state = workout;
  }

  Workout getSelectedWorkout() {
    return state;
  }

  void _startTimer() {
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tickerClassStream(ticks: state.timerDuration).listen((duration) {
      state = state.copyWith(timerDuration: duration, workoutState: WorkoutState.running);
    });
    _tickerSubscription?.onDone(() {
      state = state.copyWith(workoutState: WorkoutState.finished);
      if (state.timerDuration == 0) {
        _onTimerFinised();
      }
    });
  }

  void finished() {
    _tickerSubscription?.cancel();
    state = state.copyWith(workoutState: WorkoutState.finished);
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
