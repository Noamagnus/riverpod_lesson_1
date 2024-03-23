import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_first_riverpod/data/enums/state_status_enum.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';

part 'add_exercise_rest_event.dart';

part 'add_exercise_rest_state.dart';

class AddExerciseRestBloc extends Bloc<AddExerciseRestEvent, AddExerciseRestState> {
  AddExerciseRestBloc({required this.exerciseRepo})
      : super(
          AddExerciseRestState(
            exercise: ExerciseRest.initial(),
            status: StateStatus.loaded,
          ),
        ) {
    on<EditExerciseRestEvent>(_onEditExerciseRestEvent);
    on<SaveExerciseRest>(_onSaveExerciseRest);
  }

  FutureOr<void> _onEditExerciseRestEvent(
    EditExerciseRestEvent event,
    Emitter<AddExerciseRestState> emit,
  ) {
    final exercise = state.exercise;
    final newExercise = exercise.copyWith(
      restTime: event.restingTime ?? exercise.restTime,
    );
    emit(
      state.copyWith(
        exercise: newExercise,
      ),
    );
  }

  FutureOr<void> _onSaveExerciseRest(
    SaveExerciseRest event,
    Emitter<AddExerciseRestState> emit,
  ) {
    exerciseRepo.addExercise(event.exercise);
    emit(state.copyWith(status: StateStatus.success));
    emit(state.copyWith(status: StateStatus.loaded));
  }

  final ExerciseRepo exerciseRepo;
}
