import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';

final timerProvider = StateNotifierProvider<TimerNotifier, TimerModel>(
  (ref) {
    final exercise = ref.watch(exerciseNotifierProvider);
    return TimerNotifier(ref, exercise);
  },
);

class TimerNotifier extends StateNotifier<TimerModel> {
  // String initial;
  TimerNotifier(this.ref, Exercise exercise)
      : super(TimerModel(
          _durationString(exercise.hangingTime),
          ButtonState.initial,
        ));
  Ref ref;

  // static const int _initialDuration = 10;
  // static final _initialState = TimerModel(
  //   _durationString(_initialDuration),
  //   ButtonState.initial,
  // );

  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  static String _durationString(int duration) {
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }

  void start(int intruder) {
    if (state.buttonState == ButtonState.paused) {
      _restartTimer();
    } else {
      _startTimer(intruder);
    }
  }

  void _restartTimer() {
    _tickerSubscription?.resume();
    state = TimerModel(state.timeLeft, ButtonState.started);
  }

  void _startTimer(int intruder) {
    _tickerSubscription?.cancel();

    _tickerSubscription = _ticker.tickerClassStream(ticks: intruder).listen((duration) {
      state = TimerModel(_durationString(duration), ButtonState.started);
    });

    _tickerSubscription?.onDone(() {
      state = TimerModel(state.timeLeft, ButtonState.finished);
      ref.read(exerciseStateNotifierProvider.notifier).startExersicse();
    });

    state = TimerModel(
        _durationString(ref.read(exerciseNotifierProvider).hangingTime), ButtonState.started);
  }

  void pause() {
    _tickerSubscription?.pause();
    state = TimerModel(state.timeLeft, ButtonState.paused);
  }

  void reset() {
    _tickerSubscription?.cancel();
    final exercise = ref.read(exerciseNotifierProvider);
    state = TimerModel(
      _durationString(exercise.hangingTime),
      ButtonState.initial,
    );
  }
}

class Ticker {
  Stream<int> tickerClassStream({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
