import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';
import 'package:my_first_riverpod/providers/action_workout_provider.dart';
import 'package:my_first_riverpod/widgets/app_square_icon_button.dart';

class ButtonsContainer extends HookConsumerWidget {
  const ButtonsContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    // final state = ref.watch(actionWorkoutProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // if (state.workoutState == WorkoutState.initial) ...[
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     // size: 50,
        //     icon: Icons.fast_rewind,
        //     onPressed: () {},
        //   ),
        //   const StartButton(),
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     icon: Icons.fast_forward,
        //     onPressed: () {},
        //   ),
        // ],
        // if (state.workoutState == WorkoutState.running) ...[
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     // size: 50,
        //     icon: Icons.fast_rewind,
        //     onPressed: () {},
        //   ),
        //   const PauseButton(),
        //   const ResetButton(),
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     icon: Icons.fast_forward,
        //     onPressed: () {},
        //   ),
        // ],
        // if (state.workoutState == WorkoutState.paused) ...[
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     // size: 50,
        //     icon: Icons.fast_rewind,
        //     onPressed: () {},
        //   ),
        //   const StartButton(),
        //   const ResetButton(),
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     icon: Icons.fast_forward,
        //     onPressed: () {},
        //   ),
        // ],
        // if (state.workoutState == WorkoutState.finished) ...[
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     // size: 50,
        //     icon: Icons.fast_rewind,
        //     onPressed: () {},
        //   ),
        //   const ResetButton(),
        //   AppSquareIconButton(
        //     backgroundColor: Colors.white,
        //     icon: Icons.fast_forward,
        //     onPressed: () {},
        //   ),
        // ],
      ],
    );
  }
}

class StartButton extends HookConsumerWidget {
  const StartButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return AppSquareIconButton(
      backgroundColor: Colors.white,
      onPressed: () {
        // ref.read(actionWorkoutProvider.notifier).startWorkout();
      },
      icon: Icons.play_arrow,
    );
  }
}

class PauseButton extends HookConsumerWidget {
  const PauseButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return AppSquareIconButton(
      backgroundColor: Colors.white,
      onPressed: () {
        // ref.read(actionWorkoutProvider.notifier).pauseWorkout();
      },
      icon: Icons.pause,
    );
  }
}

class ResetButton extends HookConsumerWidget {
  const ResetButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return AppSquareIconButton(
      backgroundColor: Colors.white,
      onPressed: () {
        // ref.read(actionWorkoutProvider.notifier).resetWorkout();
      },
      icon: Icons.replay,
    );
  }
}
