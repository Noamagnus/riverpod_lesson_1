import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

part 'add_exercise_event.dart';

part 'add_exercise_state.dart';

class AddExerciseBloc extends Bloc<AddExerciseEvent, AddExerciseState> {
  AddExerciseBloc({required this.exerciseRepo})
      : super(
          AddExerciseState(
            exerciseType: ExerciseTypeNew.repeaters,
          ),
        ) {
    on<ExerciseTypeChangedEvent>(_onExerciseTypeChangedEvent);
    on<SaveExerciseEvent>(_onSaveExerciseEvent);
  }

  FutureOr<void> _onExerciseTypeChangedEvent(
    ExerciseTypeChangedEvent event,
    Emitter<AddExerciseState> emit,
  ) {
    emit(
      state.copyWith(
        exerciseType: event.exerciseType,
      ),
    );
  }

  FutureOr<void> _onSaveExerciseEvent(
    SaveExerciseEvent event,
    Emitter<AddExerciseState> emit,
  ) {
    exerciseRepo.addExercise(event.exercise);
    // emit(
    //   state.copyWith(
    //     status: AddExerciseStateStatus.success,
    //     message: 'Exercise added successfully',
    //   ),
    // );
    // emit(
    //   state.copyWith(
    //     status: AddExerciseStateStatus.loaded,
    //   ),
    // );
  }

  final ExerciseRepo exerciseRepo;
}
