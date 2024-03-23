part of 'add_exercise_rest_bloc.dart';

abstract class AddExerciseRestEvent extends Equatable {
  const AddExerciseRestEvent();
}

class EditExerciseRestEvent extends AddExerciseRestEvent {
  final int? restingTime;
  final bool? startAfterFinish;

  const EditExerciseRestEvent({
    this.restingTime,
    this.startAfterFinish,
  });

  @override
  List<Object?> get props => [
    restingTime,
    startAfterFinish,
  ];
}
class SaveExerciseRest extends AddExerciseRestEvent {
  final ExerciseRest exercise;

  const SaveExerciseRest({required this.exercise});

  @override
  List<Object?> get props => [exercise];
}
