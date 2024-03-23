part of 'add_exercise_repeaters_bloc.dart';

class AddExerciseRepeatersState extends Equatable {
  const AddExerciseRepeatersState({
    required this.exercise,
    required this.status,
  });

  final ExerciseRepeaters exercise;
  final StateStatus status;

  @override
  List<Object?> get props => [
        exercise,
        status,
      ];

  AddExerciseRepeatersState copyWith({
    ExerciseRepeaters? exercise,
    StateStatus? status,
  }) {
    return AddExerciseRepeatersState(
      exercise: exercise ?? this.exercise,
      status: status ?? this.status,
    );
  }
}
