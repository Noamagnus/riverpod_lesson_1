import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:my_first_riverpod/data/enums/state_status_enum.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';

part 'add_exercise_repeaters_event.dart';

part 'add_exercise_repeaters_state.dart';

class AddExerciseRepeatersBloc extends Bloc<AddExerciseRepeatersEvent, AddExerciseRepeatersState> {
  AddExerciseRepeatersBloc({required this.exerciseRepo})
      : super(
          AddExerciseRepeatersState(
            exercise: ExerciseRepeaters.initial(),
            status: StateStatus.loaded,
          ),
        ) {
    on<EditExerciseRepeatersEvent>(_onEditExerciseRepeatersEvent);
    on<SaveExerciseRepeaters>(_onAddExercise);
  }

  FutureOr<void> _onEditExerciseRepeatersEvent(
    EditExerciseRepeatersEvent event,
    Emitter<AddExerciseRepeatersState> emit,
  ) {
    final exercise = state.exercise;
    final newExercise = exercise.copyWith(
      hangingTime: event.hangingTime ?? exercise.hangingTime,
      restingTime: event.restingTime ?? exercise.restingTime,
      reps: event.sets ?? exercise.reps,
      estimatedTime: event.estimatedTime ?? exercise.estimatedTime,
      startAfterFinish: event.startAfterFinish ?? exercise.startAfterFinish,
      showDetails: event.showDetails ?? exercise.showDetails,
    );
    emit(
      state.copyWith(
        exercise: newExercise,
      ),
    );
  }

  FutureOr<void> _onAddExercise(
    SaveExerciseRepeaters event,
    Emitter<AddExerciseRepeatersState> emit,
  ) {
    exerciseRepo.addExercise(event.exercise);
    emit(state.copyWith(status: StateStatus.success));
    emit(state.copyWith(status: StateStatus.loaded));
  }

  final ExerciseRepo exerciseRepo;
}
