import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:my_first_riverpod/providers/timer_notifier.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

class ButtonsContainer extends HookConsumerWidget {
  const ButtonsContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(timerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.buttonState == TimerState.initial) ...[
          const StartButton(),
        ],
        if (state.buttonState == TimerState.started) ...[
          const PauseButton(),
          const SizedBox(width: 20),
          const ResetButton(),
        ],
        if (state.buttonState == TimerState.paused) ...[
          const StartButton(),
          const SizedBox(width: 20),
          const ResetButton(),
        ],
        if (state.buttonState == TimerState.finished) ...[
          const ResetButton(),
        ],
      ],
    );
  }
}

class StartButton extends HookConsumerWidget {
  const StartButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      onPressed: () {
        
        ref.read(timerProvider.notifier).start();
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}

class PauseButton extends HookConsumerWidget {
  const PauseButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(timerProvider.notifier).pause();
      },
      child: const Icon(Icons.pause),
    );
  }
}

class ResetButton extends HookConsumerWidget {
  const ResetButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(timerProvider.notifier).reset();
      },
      child: const Icon(Icons.replay),
    );
  }
}
