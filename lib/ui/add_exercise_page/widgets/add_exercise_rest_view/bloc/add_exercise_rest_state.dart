part of 'add_exercise_rest_bloc.dart';

class AddExerciseRestState extends Equatable {
  const AddExerciseRestState({
    required this.exercise,
    required this.status,
  });

  final ExerciseRest exercise;
  final StateStatus status;

  @override
  List<Object?> get props => [
    exercise,
    status,
  ];

  AddExerciseRestState copyWith({
    ExerciseRest? exercise,
    StateStatus? status,
  }) {
    return AddExerciseRestState(
      exercise: exercise ?? this.exercise,
      status: status ?? this.status,
    );
  }
}
