part of 'add_exercise_bloc.dart';

class AddExerciseState extends Equatable {
  const AddExerciseState({
    required this.exerciseType,
    this.message = '',
  });

  final ExerciseTypeNew exerciseType;
  final String message;

  @override
  List<Object?> get props => [
        exerciseType,
        message,
      ];

  AddExerciseState copyWith({
    ExerciseTypeNew? exerciseType,
    String? message,
  }) {
    return AddExerciseState(
      exerciseType: exerciseType ?? this.exerciseType,
      message: message ?? this.message,
    );
  }
}

// enum AddExerciseStateStatus {
//   initial,
//   loading,
//   loaded,
//   error,
//   success,
// }
//
// class AddExerciseState extends Equatable {
//   const AddExerciseState({
//     required this.exercise,
//     required this.status,
//     this.message = '',
//   });
//
//   final Exercise exercise;
//   final AddExerciseStateStatus status;
//   final String message;
//
//   @override
//   List<Object?> get props => [exercise, status, message];
//
//   AddExerciseState copyWith({
//     Exercise? exercise,
//     AddExerciseStateStatus? status,
//     String? message,
//   }) {
//     return AddExerciseState(
//       exercise: exercise ?? this.exercise,
//       status: status ?? this.status,
//       message: message ?? this.message,
//     );
//   }
// }
