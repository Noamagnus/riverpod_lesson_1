import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/timer_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/action_workout_provider.dart';
import 'package:my_first_riverpod/providers/timer2_provider.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/buttons_container2.dart';
import 'package:my_first_riverpod/widgets/timer_rest_text_widget.dart';

class ActionScreen extends ConsumerWidget {
  const ActionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timer2Provider);
    final workout = ref.watch(actionWorkoutProvider);

    //! fix this is not working
    final workoutItems = workout.workoutItems;
    final workoutStep = workout.workoutStep;
    final exercise = workoutItems[workoutStep].exercise;
    return Scaffold(
      body: Center(
          child: workoutItems[workoutStep].workoutItemState == WorkoutItemState.exercise
              ? ActionExerciseWidget(
                  exercise: exercise,
                  timerState: timerState,
                )
              : const ActionRestWidget()),
    );
  }
}

class ActionExerciseWidget extends StatelessWidget {
  const ActionExerciseWidget({
    Key? key,
    required this.exercise,
    required this.timerState,
  }) : super(key: key);

  final Exercise? exercise;
  final TimerModel timerState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Text(
                'Hanging ${exercise!.hangingTime} Resting ${exercise!.restingTime} Reps ${exercise!.reps}'),
            const SizedBox(
              height: 10,
            ),
            Text('Reps ${exercise!.reps}'),
            if (exercise!.exerciseState == ExerciseState.hanging) ...[const Text('Hanging Time')],
            if (exercise!.exerciseState == ExerciseState.resting) ...[
              const Text('Resting Time'),
            ],
            const SizedBox(
              height: 10,
            ),
            Text(exercise!.imageUrl ?? 'NO url'),
            const SizedBox(
              height: 10,
            ),
            Text(exercise!.displayDetails.toString()),
            Consumer(
              builder: (context, ref, child) => TextButton(
                onPressed: () {
                  ref.read(actionWorkoutProvider.notifier).startWorkout();
                },
                child: Text('Start Workout'),
              ),
            )
          ],
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final timeLeft = ref.watch(timer2Provider);
            return Column(
              children: [
                TimerTextWidget(
                  timeLeft: timeLeft,
                ),
                const SizedBox(height: 20),
                const ButtonsContainer2(),
                const SizedBox(
                  height: 100,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ActionRestWidget extends StatelessWidget {
  const ActionRestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final timeLeft = ref.watch(timer2Provider);

            return Column(
              children: [
                Text(
                  'Rest',
                  style: Theme.of(context).textTheme.headline1,
                ),
                addVerticalSpace(20),
                TimerTextWidget(
                  timeLeft: timeLeft,
                ),
                const SizedBox(height: 20),
                const ButtonsContainer2(),
                const SizedBox(
                  height: 100,
                ),
                TextButton(
                  onPressed: () {
                    ref.read(actionWorkoutProvider.notifier).startWorkout();
                  },
                  child: const Text('Start Workout'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
