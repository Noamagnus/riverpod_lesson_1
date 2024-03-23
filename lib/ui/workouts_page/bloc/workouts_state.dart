part of 'workouts_bloc.dart';

// class WorkoutsState extends Equatable {
//   const WorkoutsState();
// }
//
// class WorkoutsInitial extends WorkoutsState {
//   @override
//   List<Object> get props => [];
// }

enum WorkoutsStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class WorkoutsState extends Equatable {
  const WorkoutsState({required this.workouts, required this.status});

  final List<Workout> workouts;
  final WorkoutsStateStatus status;

  @override
  List<Object?> get props => [workouts, status];

  WorkoutsState copyWith({
    List<Workout>? workouts,
    WorkoutsStateStatus? status,
  }) {
    return WorkoutsState(
      workouts: workouts ?? this.workouts,
      status: status ?? this.status,
    );
  }
}
