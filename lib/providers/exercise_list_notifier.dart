import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:uuid/uuid.dart';

final exerciseListProvider = StateNotifierProvider<ExerciseListNotifier, List<Exercise>>((ref) {
  return ExerciseListNotifier();
});

class ExerciseListNotifier extends StateNotifier<List<Exercise>> {
  ExerciseListNotifier() : super(exerciseList);

  void addExercise(Exercise exercise) {
    state.add(exercise.copyWith(uuid: uuid.v4()));
  }

  
}

Uuid uuid = const Uuid();
List<Exercise> exerciseList = [
  Exercise(
    uuid: uuid.v4(),
    hangingTime: 7,
    restingTime: 3,
    reps: 3,
    exerciseState: ExerciseState.initial,
  ),
  Exercise(
    uuid: uuid.v4(),
    hangingTime: 8,
    restingTime: 3,
    reps: 4,
    exerciseState: ExerciseState.initial,
  ),
  Exercise(
    uuid: uuid.v4(),
    hangingTime: 9,
    restingTime: 3,
    reps: 2,
    exerciseState: ExerciseState.initial,
  ),
  Exercise(
    uuid: uuid.v4(),
    hangingTime: 10,
    restingTime: 3,
    reps: 3,
    exerciseState: ExerciseState.initial,
  )
];
