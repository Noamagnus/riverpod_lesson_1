import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier() : super(_initialState);

  static const int _initialDuration = 10;
  static final _initialState = TimerModel(
    _durationString(_initialDuration),
    ButtonState.initial,
  );

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

  void start() {
    if (state.buttonState == ButtonState.paused) {
      _restartTimer();
    } else {
      _startTimer();
    }
  }

  void _restartTimer() {
    _tickerSubscription?.resume();
    state = TimerModel(state.timeLeft, ButtonState.started);
  }
//! try swapping state with _tickerSubscription and see what's gonna happen
  void _startTimer() {
    _tickerSubscription?.cancel();

    _tickerSubscription = _ticker.tickerClassStream(ticks: _initialDuration).listen((duration) {
      state = TimerModel(_durationString(duration), ButtonState.started);
    });

    _tickerSubscription?.onDone(() {
      state = TimerModel(state.timeLeft, ButtonState.finished);
    });

    state = TimerModel(_durationString(_initialDuration), ButtonState.started);
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

final timerProvider = StateNotifierProvider<TimerNotifier, TimerModel>(
  (ref) => TimerNotifier(),
);