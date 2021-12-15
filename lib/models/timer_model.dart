class TimerModel {
  final String? timeLeft;
  // final int initialDuration;
  final TimerState buttonState;

  const TimerModel(this.timeLeft, this.buttonState);
}

enum TimerState { initial, started, paused, finished }
