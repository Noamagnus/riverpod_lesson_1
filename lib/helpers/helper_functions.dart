import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';

String durationString(int duration) {
  final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
  final seconds = (duration % 60).floor().toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

Exercise? getExerciseFromWorkout(Workout workout) {
  final workoutItems = workout.workoutItems;
  final workoutStep = workout.workoutStep;
  return workoutItems[workoutStep].exercise;
}

WorkoutItem getWorkoutItemFromWorkout(Workout workout) {
  final workoutItems = workout.workoutItems;
  final workoutStep = workout.workoutStep;
  return workoutItems[workoutStep];
}

int getWorkoutItemIndex(Workout workout) {
  final workoutStep = workout.workoutStep;

  return workoutStep;
}
