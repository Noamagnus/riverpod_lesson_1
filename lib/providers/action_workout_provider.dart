
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/rest_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/timer2_provider.dart';

import 'package:uuid/uuid.dart';



Uuid uuid = const Uuid();
final actionWorkoutProvider = StateNotifierProvider<WorkoutStateNotifier, Workout>((ref) {
  return WorkoutStateNotifier(ref);
});

class WorkoutStateNotifier extends StateNotifier<Workout> {
  WorkoutStateNotifier(this.ref) : super(Workout(uuid: uuid.v4()));

  Ref ref; 

  List<WorkoutItem> showAllWorkoutItems() {
    return state.workoutItems;
  }

  void _startWorkout() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    if (workoutItem.workoutItemState == WorkoutItemState.exercise) {
      _startExercise(workoutItem.exercise);
    } else {
      _startRest(workoutItem.rest);
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

  /// Fires if WorkoutItem is Rest
  void _startRest(Rest? rest) {
    final timeToCount = rest!.restTime;
    _setTimeAndStart(timeToCount);
  }

  /// this one sets time for timer and starts timer
  void _setTimeAndStart(int timeToCount) {
    ref.read(timer2Provider.notifier).setTimeToCount(timeToCount);
    ref.read(timer2Provider.notifier).start();
  }

//! methods regarding Exercise
  ExerciseState _getExerciseState() {
    final workoutStep = _getWorkoutStep();
    final workoutItemsList = state.workoutItems;
    final workoutItem = workoutItemsList[workoutStep];
    final exercise = workoutItem.exercise;
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


  /// fires from TimerNotifier
 
  void onTimerFinised() {
    final step = _getWorkoutStep();
    final workoutItem = state.workoutItems[step];
    if (workoutItem.workoutItemState == WorkoutItemState.exercise) {
      _workoutItemIsExercise();
    } else {
      _workoutItemIsRest();
    }
  }

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

  bool _isEnd() {
    final workoutStep = _getWorkoutStep();
    final listOfWorkoutItems = state.workoutItems.length;
    return (listOfWorkoutItems - 1 == workoutStep);
  }

  void _workoutItemIsRest() {
    if (_isEnd()) {
      pauseWorkout();
    } else {
      _addWorkoutStep();
      _startWorkout();
    }
  }

  //! Workout related methods
  int _getWorkoutStep() {
    return state.workoutStep;
  }

  void _addWorkoutStep() {
    final currentStep = _getWorkoutStep();
    state = state.copyWith(workoutStep: currentStep + 1);
  }

  void startWorkout() {
    _startWorkout();
    state = state.copyWith(workoutState: WorkoutState.running);
  }

  void restartWorkout() {
    _startWorkout();
    state = state.copyWith(workoutState: WorkoutState.running);
  }

  void pauseWorkout() {
    ref.read(timer2Provider.notifier).pause();
    state = state.copyWith(workoutState: WorkoutState.paused);
  }

  void resetWorkout() {
    ref.read(timer2Provider.notifier).reset();
    state = state.copyWith(workoutState: WorkoutState.initial);
  }

  void selectWorkoutFromList(Workout workout) {
    state = workout;
  }

  Workout getSelectedWorkout() {
    return state;
  }
}
