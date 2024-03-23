part of 'exercise_list_bloc.dart';

enum ExerciseListStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ExerciseListState extends Equatable {
  const ExerciseListState({required this.exercises, required this.status});

  final List<Exercise> exercises;
  final ExerciseListStateStatus status;

  @override
  List<Object?> get props => [exercises, status];

  ExerciseListState copyWith({
    List<Exercise>? exercises,
    ExerciseListStateStatus? status,
  }) {
    return ExerciseListState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
    );
  }
}
