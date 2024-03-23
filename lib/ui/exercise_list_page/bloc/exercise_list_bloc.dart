import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';

part 'exercise_list_event.dart';

part 'exercise_list_state.dart';

class ExerciseListBloc extends Bloc<ExerciseListEvent, ExerciseListState> {
  ExerciseListBloc({required this.exerciseRepo})
      : super(
          const ExerciseListState(
            exercises: [],
            status: ExerciseListStateStatus.initial,
          ),
        ) {
    _exerciseRepoSubscription = exerciseRepo.exerciseListStream.listen((exercises) {
      add(UpdateExercises(exercises: exercises));
    });
    on<InitialExercisesEvent>(_onInitialExercisesEvent);
    on<UpdateExercises>(_onUpdateExercises);
    on<DeleteExercise>(_onDeleteExercise);
  }

  FutureOr<void> _onInitialExercisesEvent(
    InitialExercisesEvent event,
    Emitter<ExerciseListState> emit,
  ) {
    exerciseRepo.getExercises();
  }

  FutureOr<void> _onUpdateExercises(
    UpdateExercises event,
    Emitter<ExerciseListState> emit,
  ) {
    emit(
      state.copyWith(
        exercises: event.exercises,
        status: ExerciseListStateStatus.loaded,
      ),
    );
  }

  FutureOr<void> _onDeleteExercise(
      DeleteExercise event,
      Emitter<ExerciseListState> emit,
  ) {
    exerciseRepo.deleteExercise(event.exercise);
  }

  late StreamSubscription<List<Exercise>> _exerciseRepoSubscription;
  final ExerciseRepo exerciseRepo;

  @override
  Future<void> close() {
    _exerciseRepoSubscription.cancel();
    return super.close();
  }

}
