part of 'exercise_list_bloc.dart';

abstract class ExerciseListEvent extends Equatable {
  const ExerciseListEvent();
}

class InitialExercisesEvent extends ExerciseListEvent {
  const InitialExercisesEvent();

  @override
  List<Object?> get props => [];
}

class UpdateExercises extends ExerciseListEvent {
  final List<Exercise> exercises;

  const UpdateExercises({required this.exercises});

  @override
  List<Object?> get props => [exercises];
}

class AddExercise extends ExerciseListEvent {
  final Exercise exercise;

  const AddExercise({required this.exercise});

  @override
  List<Object?> get props => [exercise];
}

class DeleteExercise extends ExerciseListEvent {
  final Exercise exercise;

  const DeleteExercise({required this.exercise});

  @override
  List<Object?> get props => [exercise];
}
