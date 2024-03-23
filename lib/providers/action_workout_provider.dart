// import 'dart:async';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_first_riverpod/models/exercise_model.dart';
// import 'package:my_first_riverpod/models/workout_model.dart';
//
// import 'package:uuid/uuid.dart';
//
// Uuid uuid = const Uuid();
// final actionWorkoutProvider = StateNotifierProvider<ActionWorkoutStateNotifier, Workout>((ref) {
//   return ActionWorkoutStateNotifier(ref);
// });
//
// class ActionWorkoutStateNotifier extends StateNotifier<Workout> {
//   ActionWorkoutStateNotifier(
//     this.ref,
//   ) : super(Workout(uuid: uuid.v4()));
//   Ref ref;
//
//   final Ticker _ticker = Ticker();
//   StreamSubscription<int>? _tickerSubscription;
//
//   @override
//   void dispose() {
//     _tickerSubscription?.cancel();
//     super.dispose();
//   }
//
//   void selectWorkoutFromList(Workout workout) {
//     state = workout;
//   }
//
//   Workout getSelectedWorkout() {
//     return state;
//   }
//
//   List<Exercise> getAllExercises() {
//     return state.listOfExercises;
//   }
//
//   void setInitialTimerDuration(Workout workout) {
//     final workoutStep = _getWorkoutStep();
//     final workoutExerciseList = state.listOfExercises;
//     final exercise = workoutExerciseList[workoutStep];
//     switch (exercise.exerciseType) {
//       case ExerciseType.repeaters:
//         state = state.copyWith(timerDuration: exercise.hangingTime);
//         break;
//       case ExerciseType.fixedTime:
//         state = state.copyWith(timerDuration: exercise.estimatedTime);
//         break; // case WorkoutItemType.rest:
//       //   return _startRest(exercise.rest);
//       case ExerciseType.tabata:
//         // TODO: Handle this case.
//       case ExerciseType.campus:
//         // TODO: Handle this case.
//       case ExerciseType.system:
//         // TODO: Handle this case.
//       case ExerciseType.boulder:
//         // TODO: Handle this case.
//       case ExerciseType.fingerboard:
//         // TODO: Handle this case.
//     }
//   }
//
// //todo
//   void _startWorkout() {
//     final workoutStep = _getWorkoutStep();
//     final workoutExerciseList = state.listOfExercises;
//     final exercise = workoutExerciseList[workoutStep];
//     _exerciseTypeCheck(exercise);
//   }
//
//   void _exerciseTypeCheck(Exercise exercise) {
//     switch (exercise.exerciseType) {
//       case ExerciseType.repeaters:
//         return _startExercise(exercise);
//       case ExerciseType.fixedTime:
//         return _startExerciseFixed(exercise);
//       // case WorkoutItemType.rest:
//       //   return _startRest(exercise.rest);
//
//       case ExerciseType.tabata:
//         // TODO: Handle this case.
//       case ExerciseType.campus:
//         // TODO: Handle this case.
//       case ExerciseType.system:
//         // TODO: Handle this case.
//       case ExerciseType.boulder:
//         // TODO: Handle this case.
//       case ExerciseType.fingerboard:
//         // TODO: Handle this case.
//     }
//   }
//
//   /// Fires if WorkoutItem is Exercise
//   void _startExercise2(Exercise? exercise) {
//     if (exercise!.exerciseState == ExerciseState.initial ||
//         exercise.exerciseState == ExerciseState.hanging) {
//       _setExerciseState(ExerciseState.hanging);
//       final timeToCount = exercise.hangingTime;
//       _setTimeAndStart(timeToCount);
//     } else if (exercise.exerciseState == ExerciseState.resting) {
//       final timeToCount = exercise.restingTime;
//       _setTimeAndStart(timeToCount);
//     }
//   }
//
//   void _startExercise(Exercise? exercise) {
//     switch (exercise!.exerciseState) {
//       case ExerciseState.initial:
//         _setExerciseState(ExerciseState.initial);
//         if (exercise.prepareTime == 0) {
//           _setExerciseState(ExerciseState.hanging);
//           _startExercise(exercise);
//         } else {
//           final timeToCount = exercise.prepareTime;
//           _setTimeAndStart(timeToCount);
//         }
//         break;
//       case ExerciseState.hanging:
//         final timeToCount = exercise.hangingTime;
//         _setTimeAndStart(timeToCount);
//         break;
//       case ExerciseState.resting:
//         final timeToCount = exercise.restingTime;
//         _setTimeAndStart(timeToCount);
//         break;
//       case ExerciseState.restingAfter:
//         final timeToCount = exercise.restAfterExercise;
//         _setTimeAndStart(timeToCount);
//         break;
//       case ExerciseState.finished:
//         // TODO: Handle this case.
//     }
//   }
//
//   ///Fires when ExerciseType is fixedTime
//   void _startExerciseFixed(Exercise? exerciseFixed) {
//     final timeToCount = exerciseFixed!.estimatedTime;
//     _setTimeAndStart(timeToCount);
//   }
//
//   /// this one sets time for timer and starts timer
//   void _setTimeAndStart(int timeToCount) {
//     state = state.copyWith(timerDuration: timeToCount);
//     _startTimer();
//   }
//
// //! methods regarding Exercises
//   Exercise? _getExerciseFromWorkout() {
//     final workoutStep = _getWorkoutStep();
//     final listOfExercises = state.listOfExercises;
//     return listOfExercises[workoutStep];
//   }
//
//   ExerciseState _getExerciseState() {
//     final exercise = _getExerciseFromWorkout();
//     return exercise!.exerciseState;
//   }
//
//   void _setExerciseState(ExerciseState exerciseState) {
//     final workoutStep = _getWorkoutStep();
//     final listOfExercises = state.listOfExercises;
//     final exercise = listOfExercises[workoutStep];
//     final newExercise = exercise.copyWith(exerciseState: exerciseState);
//     listOfExercises.removeAt(workoutStep);
//     listOfExercises.insert(workoutStep, newExercise);
//     state = state.copyWith(listOfExercises: listOfExercises);
//   }
//
//   int _getExerciseReps() {
//     final exercise = _getExerciseFromWorkout();
//     return exercise!.reps;
//   }
//
//   void _setExerciseReps(int reps) {
//     final workoutStep = _getWorkoutStep();
//     final listOfExercises = state.listOfExercises;
//     final exercise = listOfExercises[workoutStep];
//
//     final newExercise = exercise.copyWith(reps: reps);
//     // final newWorkoutItem = workoutItem.copyWith(exercise: newExercise);
//     listOfExercises.removeAt(workoutStep);
//     listOfExercises.insert(workoutStep, newExercise);
//     state = state.copyWith(listOfExercises: listOfExercises);
//   }
//
// //! Method regarding ExerciseFixed
// //! Its question weather I need this
//   Exercise? getExerciseFixedFromWorkout() {
//     final exercise = _getExerciseFromWorkout();
//     return exercise;
//     // final workoutStep = _getWorkoutStep();
//     // final workoutItemsList = state.workoutItems;
//     // final workoutItem = workoutItemsList[workoutStep];
//     // return workoutItem.exerciseFixed;
//   }
//
//   bool _getToStopOrNot() {
//     final exerciseFixed = getExerciseFixedFromWorkout();
//     return exerciseFixed!.startAfterFinish;
//   }
//
//   void toggleExerciseFixedOnFinish() {
//     final workoutStep = _getWorkoutStep();
//     final listOfExercises = state.listOfExercises;
//     final exerciseFixed = listOfExercises[workoutStep];
//     final newExerciseFixed =
//         exerciseFixed.copyWith(startAfterFinish: !exerciseFixed.startAfterFinish);
//     listOfExercises.removeAt(workoutStep);
//     listOfExercises.insert(workoutStep, newExerciseFixed);
//     state = state.copyWith(listOfExercises: listOfExercises);
//   }
//
//   /// fires from TimerNotifier
//
//   void _onTimerFinised() {
//     final step = _getWorkoutStep();
//     final exercise = state.listOfExercises[step];
//     switch (exercise.exerciseType) {
//       case ExerciseType.repeaters:
//         return _exerciseRepeatersLogic();
//       case ExerciseType.fixedTime:
//         return _exerciseFixedLogic();
//       // case WorkoutItemType.rest:
//       //   return _workoutItemIsRest();
//       case ExerciseType.tabata:
//       // TODO: Handle this case.
//       case ExerciseType.campus:
//       // TODO: Handle this case.
//       case ExerciseType.system:
//       // TODO: Handle this case.
//       case ExerciseType.boulder:
//       // TODO: Handle this case.
//       case ExerciseType.fingerboard:
//       // TODO: Handle this case.
//     }
//   }
//
// // Fires after timer is finished and ExerciseType is repeaters
//   void _exerciseRepeatersLogic() {
//     final exerciseState = _getExerciseState();
//     final currentReps = _getExerciseReps();
//      if (exerciseState == ExerciseState.initial) {
//       _setExerciseState(ExerciseState.hanging);
//       _startWorkout();
//     }
//     else if (exerciseState == ExerciseState.hanging) {
//       _setExerciseState(ExerciseState.resting);
//       _startWorkout();
//     }
//     else if (exerciseState == ExerciseState.resting && currentReps >= 2) {
//       _setExerciseState(ExerciseState.hanging);
//       _setExerciseReps(currentReps - 1);
//       _startWorkout();
//     }
//     else if (exerciseState == ExerciseState.resting && currentReps ==1) {
//       _setExerciseState(ExerciseState.restingAfter);
//       _setExerciseReps(currentReps - 1);
//       _startWorkout();
//     }
//     else {
//       if (_isEnd()) {
//         _setExerciseState(ExerciseState.initial);
//         final exercise = _getExerciseFromWorkout();
//         _setExerciseReps(exercise!.initialReps!);
//         pauseWorkout();
//       } else {
//         _setExerciseState(ExerciseState.initial);
//         final exercise = _getExerciseFromWorkout();
//         _setExerciseReps(exercise!.initialReps!);
//         _addWorkoutStep();
//         _startWorkout();
//       }
//     }
//   }
//
//   //
//
//   // Fires after timer is finished and WorkoutItem is ExerciseFixed
//   void _exerciseFixedLogic() {
//     if (_isEnd()) {
//       pauseWorkout();
//     } else {
//       if (!_getToStopOrNot()) {
//         pauseWorkout();
//         state = state.copyWith(workoutState: WorkoutState.pausedAfterExerciseFixed);
//       } else {
//         _addWorkoutStep();
//         _startWorkout();
//       }
//     }
//   }
//
//   bool _isEnd() {
//     final workoutStep = _getWorkoutStep();
//     final listOfExercises = state.listOfExercises.length;
//     return (listOfExercises - 1 == workoutStep);
//   }
//
//   //! Workout related methods
//   int _getWorkoutStep() {
//     return state.workoutStep;
//   }
//
//   void _addWorkoutStep() {
//     final currentStep = _getWorkoutStep();
//     state = state.copyWith(workoutStep: currentStep + 1);
//   }
//
//   void startWorkout() {
//     if (state.workoutState == WorkoutState.paused) {
//       _restartTimer();
//     } else {
//       state = state.copyWith(workoutState: WorkoutState.running);
//       _startWorkout();
//     }
//   }
//
//   void resumeWorkoutAfterExerciseFixed() {
//     _addWorkoutStep();
//     _startWorkout();
//   }
//
//   void _restartTimer() {
//     _tickerSubscription?.resume();
//     state = state.copyWith(workoutState: WorkoutState.running);
//   }
//
//   void pauseWorkout() {
//     _tickerSubscription?.pause();
//     state = state.copyWith(workoutState: WorkoutState.paused);
//   }
//
//   void resetWorkout() {
//     _tickerSubscription?.cancel();
//
//     //todo add switch to see exercise type and upon that change exercise state to initial
//     // if exerciseType is repeaters reps= initialReps bla,bla...
//     final exercise = _getExerciseFromWorkout();
//     switch (exercise!.exerciseType) {
//       case ExerciseType.repeaters:
//         _setExerciseReps(exercise.initialReps!);
//         _setExerciseState(ExerciseState.hanging);
//
//         state = state.copyWith(
//           workoutState: WorkoutState.initial,
//         );
//         break;
//       case ExerciseType.fixedTime:
//         state = state.copyWith(
//           workoutState: WorkoutState.initial,
//         );
//         break;
//       default:
//         break;
//     }
//
//     state = state.copyWith(
//       workoutState: WorkoutState.initial,
//     );
//   }
//
//   void _startTimer() {
//     _tickerSubscription?.cancel();
//     _tickerSubscription = _ticker.tickerClassStream(ticks: state.timerDuration).listen((duration) {
//       state = state.copyWith(timerDuration: duration, workoutState: WorkoutState.running);
//     });
//     _tickerSubscription?.onDone(() {
//       state = state.copyWith(workoutState: WorkoutState.finished);
//       if (state.timerDuration == 0) {
//         _onTimerFinised();
//       }
//     });
//   }
//
//   void finished() {
//     _tickerSubscription?.cancel();
//     state = state.copyWith(workoutState: WorkoutState.finished);
//   }
// }

class Ticker {
  // var player = AudioCache();
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
    // await player.play(mp3, mode: PlayerMode.LOW_LATENCY);
  }
}

// /// Fires if WorkoutItem is Rest
// void _startRest(Exercise? rest) {
//   // final timeToCount = rest!.restTime;
//   // _setTimeAndStart(timeToCount);
// }

// Fires after timer is finished and WorkoutItem is Rest
void _workoutItemIsRest() {
  // if (_isEnd()) {
  //   pauseWorkout();
  // } else {
  //   _addWorkoutStep();
  //   _startWorkout();
  // }
}

// void exerciseRepeatersLogic2(){
  //   final exerciseState = _getExerciseState();
  //   final currentReps = _getExerciseReps();
  //    switch (exerciseState) {
  //     case ExerciseState.initial:
  //         _setExerciseState(ExerciseState.hanging);
  //     _startWorkout();
  //       break;
  //     case ExerciseState.hanging:
  //       _setExerciseState(ExerciseState.resting);
  //     _startWorkout();
  //       break;
  //     case ExerciseState.resting:
  //     _setExerciseState(ExerciseState.hanging);
  //     _setExerciseReps(currentReps - 1);
  //     _startWorkout();
  //       break;
  //     case ExerciseState.restingAfter:
  //       final timeToCount = exercise.restAfterExercise;
  //       _setTimeAndStart(timeToCount);
  //       break;
  //   }
  // }
