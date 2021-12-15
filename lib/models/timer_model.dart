class TimerModel {
  final String? timeLeft;
  final TimerState buttonState;
  final TimerExerciseState timerExerciseState;
  final int reps;

  const TimerModel(this.timeLeft, this.buttonState, this.timerExerciseState,this.reps);
}

enum TimerExerciseState {
  hangTime,
  restTime,
}

enum TimerState {
  initial,
  started,
  paused,
  finished,
}
