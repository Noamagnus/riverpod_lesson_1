import 'dart:math';

class Exercise {
  final int hangingTime;
  final int restingTime;
  final int reps;
  // final ExerciseState exerciseState;

  const Exercise( 
      { this.hangingTime=7,
       this.restingTime=3,
      this.reps=2,
      });

  

  Exercise copyWith({
    int? hangingTime,
    int? restingTime,
    int? reps,
  }) {
    return Exercise(
      hangingTime:hangingTime ?? this.hangingTime,
      restingTime:restingTime ?? this.restingTime,
      reps:reps ?? this.reps,
    );
  }
}


