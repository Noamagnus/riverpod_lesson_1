part of 'add_exercise_repeaters_bloc.dart';

abstract class AddExerciseRepeatersEvent extends Equatable {
  const AddExerciseRepeatersEvent();
}

class EditExerciseRepeatersEvent extends AddExerciseRepeatersEvent {
  final int? hangingTime;
  final int? restingTime;
  final int? sets;
  final int? estimatedTime;
  final bool? startAfterFinish;
  final bool? showDetails;

  const EditExerciseRepeatersEvent({
    this.hangingTime,
    this.restingTime,
    this.sets,
    this.estimatedTime,
    this.startAfterFinish,
    this.showDetails,
});

  @override
  List<Object?> get props => [
    hangingTime,
    restingTime,
    sets,
    estimatedTime,
    startAfterFinish,
    showDetails,
  ];
}
class SaveExerciseRepeaters extends AddExerciseRepeatersEvent {
  final ExerciseRepeaters exercise;

  const SaveExerciseRepeaters({required this.exercise});

  @override
  List<Object?> get props => [exercise];
}