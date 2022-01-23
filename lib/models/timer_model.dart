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
    //  required TimerExerciseState timerExerciseState,
    //  required int reps,
    //  required int exerciseFromList,
  }) = _TimerModel;
  factory TimerModel.fromJson(Map<String, dynamic> json) => _$TimerModelFromJson(json);
}

// class TimerModel {
//   final String? timeLeft;
//   final TimerState timerState;
//   final TimerExerciseState timerExerciseState;
//   final int reps;
//   final int exerciseFromList;

//   const TimerModel(
//     this.timeLeft,
//     this.timerState,
//     this.timerExerciseState,
//     this.reps,
//     this.exerciseFromList,
//   );
// }

// enum TimerExerciseState {
//   hangTime,
//   restTime,
// }

enum TimerState {
  initial,
  started,
  paused,
  finished,
}
