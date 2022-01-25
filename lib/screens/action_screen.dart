import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_first_riverpod/helpers/helper_functions.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/action_workout_provider2.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/utils/constants.dart';
import 'package:my_first_riverpod/utils/easy_text.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/buttons_container2.dart';
import 'package:my_first_riverpod/widgets/timer_rest_text_widget.dart';

class ActionScreen extends ConsumerWidget {
  const ActionScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workout = ref.watch(actionWorkoutProvider2);
    final exercise = getExerciseFromWorkout(workout);
    final workoutItem = getWorkoutItemFromWorkout(workout);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
                child: workoutItem.workoutItemState == WorkoutItemState.exercise
                    ? ActionExerciseWidget(
                        exercise: exercise,
                        uuid: workout.uuid,
                        ref: ref,
                      )
                    :  ActionRestWidget(ref: ref,)),
          ],
        ),
      ),
    );
  }
}

class ActionExerciseWidget extends StatelessWidget {
  const ActionExerciseWidget({
    Key? key,
    required this.uuid,
    required this.exercise,
    required this.ref,
  }) : super(key: key);

  final Exercise? exercise;
  final String uuid;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final timeLeft = ref.watch(actionWorkoutProvider2).timerDuration;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            // Text(
            //     'Hanging ${exercise!.hangingTime} Resting ${exercise!.restingTime} Reps ${exercise!.initialReps}'),

            Container(
              width: double.infinity,
              height: 40,
              child: Center(child: Text(exercise?.name ?? 'No name')),
              color: Colors.black12,
            ),
            addVerticalSpace(20),
            if (exercise!.exerciseState == ExerciseState.initial) ...[
              Text(
                'Prepare',
                style: Theme.of(context).textTheme.headline3,
              ),

              // const EasyText('Prepare',fontSize: 18,fontWeight: FontWeight.bold,color: kColorBlack,),
            ],
            if (exercise!.exerciseState == ExerciseState.hanging) ...[
              Text(
                'Hanging Time',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],

            if (exercise!.exerciseState == ExerciseState.resting) ...[
              Text(
                'Resting Time',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],

            Baseline(
              baseline: 90,
              baselineType: TextBaseline.alphabetic,
              child: TimerTextWidget(
                timeLeft: timeLeft,
              ),
            ),

            addVerticalSpace(10),
            Text(
              '${exercise!.reps}/${exercise!.initialReps}',
              style: Theme.of(context).textTheme.headline2,
            ),
            addVerticalSpace(20),

            const ButtonsContainer(),
          ],
        ),
      ],
    );
  }
}

class ActionRestWidget extends StatelessWidget {
  const ActionRestWidget({
    Key? key,
    required this.ref,
  }) : super(key: key);
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    final timeLeft = ref.watch(actionWorkoutProvider2).timerDuration;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
            Container(
              width: double.infinity,
              height: 40,
              child: Center(child: Text( 'Rest')),
              color: Colors.black12,
            ),
            addVerticalSpace(20),
             Text(
                'Resting ',
                style: Theme.of(context).textTheme.headline3,
              ),
            Baseline(
              baseline: 90,
              baselineType: TextBaseline.alphabetic,
              child: TimerTextWidget(
                timeLeft: timeLeft,
              ),
            ),
            addVerticalSpace(10),
            const ButtonsContainer(),
      ],
    );
  }
}
