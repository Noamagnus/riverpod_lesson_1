class TimerModel {
  final String timeLeft;
  // final int initialDuration;
  final ButtonState buttonState;

  const TimerModel(this.timeLeft, this.buttonState);
}

enum ButtonState { initial, started, paused, finished }
