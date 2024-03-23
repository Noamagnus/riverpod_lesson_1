part of 'add_exercise_bloc.dart';

abstract class AddExerciseEvent extends Equatable {
  const AddExerciseEvent();
}

class ExerciseTypeChangedEvent extends AddExerciseEvent {
  final ExerciseTypeNew exerciseType;

  const ExerciseTypeChangedEvent({required this.exerciseType});

  @override
  List<Object?> get props => [exerciseType];
}

class SaveExerciseEvent extends AddExerciseEvent {
  final Exercise exercise;

  const SaveExerciseEvent({required this.exercise});

  @override
  List<Object?> get props => [exercise];
}
