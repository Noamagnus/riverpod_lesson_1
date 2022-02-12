import 'package:freezed_annotation/freezed_annotation.dart';
part 'timer_model.freezed.dart';
part 'timer_model.g.dart';

@freezed
class TimerModel with _$TimerModel {
  const TimerModel._();
  const factory TimerModel({
    required int timeToCount,
    required String? timeLeft,
    required TimerState timerState,
    required int duration,
  }) = _TimerModel;
  factory TimerModel.fromJson(Map<String, dynamic> json) => _$TimerModelFromJson(json);
}


enum TimerState {
  initial,
  started,
  paused,
  finished,
}
