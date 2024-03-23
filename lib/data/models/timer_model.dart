import 'package:equatable/equatable.dart';

class TimerModel extends Equatable {
  final int timeToCount;
  final String? timeLeft;
  final TimerState timerState;
  final int duration;

  const TimerModel({
    required this.timeToCount,
    required this.timeLeft,
    required this.timerState,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        timeToCount,
        timeLeft,
        timerState,
        duration,
      ];
}

enum TimerState {
  initial,
  started,
  paused,
  finished,
}
