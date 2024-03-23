import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_first_riverpod/data/dummy_data.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';

part 'workouts_event.dart';

part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc()
      : super(
          WorkoutsState(
            workouts: workoutDummyList,
            status: WorkoutsStateStatus.initial,
          ),
        ) {
    on<AddWorkout>(_onAddWorkout);
    on<DeleteWorkout>(_onDeleteWorkout);
    on<UpdateWorkout>(_onUpdateWorkout);
  }

  FutureOr<void> _onAddWorkout(
    AddWorkout event,
    Emitter<WorkoutsState> emit,
  ) {}

  FutureOr<void> _onDeleteWorkout(
    DeleteWorkout event,
    Emitter<WorkoutsState> emit,
  ) {}

  FutureOr<void> _onUpdateWorkout(
    UpdateWorkout event,
    Emitter<WorkoutsState> emit,
  ) {}
}
