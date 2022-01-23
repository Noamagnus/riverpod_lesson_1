import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/action_workout_provider2.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/buttons_container2.dart';
import 'package:my_first_riverpod/widgets/timer_rest_text_widget.dart';

class ActionScreen extends ConsumerWidget {
  const ActionScreen({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workout = ref.watch(actionWorkoutProvider2);

    //! fix this is not working
    final workoutItems = workout.workoutItems;
    final workoutStep = workout.workoutStep;
    final exercise = workoutItems[workoutStep].exercise;
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(30),
          Text(workout.uuid),
          
          Center(
              child: workoutItems[workoutStep].workoutItemState == WorkoutItemState.exercise
                  ? ActionExerciseWidget(
                      exercise: exercise,
                      
                      uuid: workout.uuid,
                    )
                  : const ActionRestWidget()),
        ],
      ),
    );
  }
}

class ActionExerciseWidget extends StatelessWidget {
  const ActionExerciseWidget({
    Key? key,
    required this.uuid,
    required this.exercise,
  }) : super(key: key);

  final Exercise? exercise;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Text(
                'Hanging ${exercise!.hangingTime} Resting ${exercise!.restingTime} Reps ${exercise!.initialReps}'),
            const SizedBox(
              height: 10,
            ),
            Text('$uuid'),
            addVerticalSpace(30),
            Text('Reps ${exercise!.reps}/${exercise!.initialReps}'),
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
                  ref.read(actionWorkoutProvider2.notifier).startWorkout();
                },
                child: Text('Start Workout'),
              ),
            )
          ],
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final timeLeft = ref.watch(actionWorkoutProvider2).timerDuration;
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
            final timeLeft = ref.watch(actionWorkoutProvider2).timerDuration;

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
                    ref.read(actionWorkoutProvider2.notifier).startWorkout();
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
