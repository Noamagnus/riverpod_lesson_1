import 'dart:math';

import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:uuid/uuid.dart';

class Exercise {
  final String uuid;
  final int hangingTime;
  final int restingTime;
  final int reps;
  final ExerciseState exerciseState;

  // final ExerciseState exerciseState;

  const Exercise({
    required this.uuid,
    required this.hangingTime,
    required this.restingTime,
    required this.reps,
    required this.exerciseState,
  });

  Exercise copyWith({
    String? uuid,
    int? hangingTime,
    int? restingTime,
    int? reps,
    ExerciseState? exerciseState,
  }) {
    return Exercise(
      uuid: uuid?? this.uuid,
      hangingTime: hangingTime ?? this.hangingTime,
      restingTime: restingTime ?? this.restingTime,
      reps: reps ?? this.reps,
      exerciseState: exerciseState ?? this.exerciseState,
    );
  }
}
