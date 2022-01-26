import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/action_workout_provider.dart';


class ButtonsContainer extends HookConsumerWidget {
  const ButtonsContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(actionWorkoutProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.workoutState == WorkoutState.initial) ...[
          const StartButton(),
        ],
        if (state.workoutState == WorkoutState.running) ...[
          const PauseButton(),
          const SizedBox(width: 20),
          const ResetButton(),
        ],
        if (state.workoutState == WorkoutState.paused) ...[
          const StartButton(),
          const SizedBox(width: 20),
          const ResetButton(),
        ],
        if (state.workoutState == WorkoutState.finished) ...[
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
      heroTag: 'Start',
      onPressed: () {
        ref.read(actionWorkoutProvider.notifier).startWorkout();
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
      heroTag: 'Pause',
      onPressed: () {
        ref.read(actionWorkoutProvider.notifier).pauseWorkout();
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
      heroTag: 'Reset',
      onPressed: () {
        ref.read(actionWorkoutProvider.notifier).resetWorkout();
      },
      child: const Icon(Icons.replay),
    );
  }
}
