part of 'workouts_bloc.dart';

abstract class WorkoutsEvent extends Equatable {
  const WorkoutsEvent();
}

class AddWorkout extends WorkoutsEvent {
  final Workout workout;

  const AddWorkout({required this.workout});

  @override
  List<Object?> get props => [workout];
}

class DeleteWorkout extends WorkoutsEvent {
  final Workout workout;

  const DeleteWorkout({required this.workout});

  @override
  List<Object?> get props => [workout];
}

class UpdateWorkout extends WorkoutsEvent {
  final Workout workout;

  const UpdateWorkout({required this.workout});

  @override
  List<Object?> get props => [workout];
}