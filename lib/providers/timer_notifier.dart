import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FakeTimerStateNotifier extends StateNotifier<TimerModel> {
  int intruder;
  FakeTimerStateNotifier(this.intruder) : super(_initialState);
  // static const int _initialDuration = 10;
  static final _initialState = TimerModel(
    _durationString(10),
    ButtonState.initial,
  );
 
  get initialDuration => intruder;

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

//! try swapping state with _tickerSubscription and see what's gonna happen
  void _startTimer(int intruder) {
    _tickerSubscription?.cancel();

    _tickerSubscription = _ticker.tickerClassStream(ticks: intruder).listen((duration) {
      state = TimerModel(_durationString(duration), ButtonState.started);
    });

    _tickerSubscription?.onDone(() {
      state = TimerModel(state.timeLeft, ButtonState.finished);
    });

    state = TimerModel(_durationString(intruder), ButtonState.started);
  }

  void pause() {
    _tickerSubscription?.pause();
    state = TimerModel(state.timeLeft, ButtonState.paused);
  }

  void reset() {
    _tickerSubscription?.cancel();
    state = _initialState;
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

final timerProvider = StateNotifierProvider<FakeTimerStateNotifier, TimerModel>(
  (ref) => FakeTimerStateNotifier(1),
);

class TimerModel {
  final String timeLeft;
  // final int initialDuration;
  final ButtonState buttonState;

  const TimerModel(this.timeLeft, this.buttonState);
}

enum ButtonState { initial, started, paused, finished }
