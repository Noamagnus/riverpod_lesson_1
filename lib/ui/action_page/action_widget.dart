import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_first_riverpod/helpers/helper_functions.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';
import 'package:my_first_riverpod/providers/action_workout_provider.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/buttons_container.dart';
import 'package:my_first_riverpod/widgets/easy_text.dart';
import 'package:my_first_riverpod/widgets/text/cd_text.dart';
import 'package:my_first_riverpod/widgets/timer_rest_text_widget.dart';

class ActionWidget extends ConsumerWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final workout = ref.watch(actionWorkoutProvider);
    final workout = const Workout.initial();
    final exercise = getExerciseFromWorkout(workout);

    return Column(
      children: [
        Center(
          child: _selectWidgetFromExerciseType(
            ref,
            exercise,
          ),
        ),
      ],
    );
  }
}

Widget _selectWidgetFromExerciseType(
  WidgetRef ref,
  Exercise? exercise,
  // Workout workout,
) {
  switch (exercise!.exerciseType) {
    case ExerciseType.repeaters:
      return ActionExerciseWidget(
        exercise: exercise,
        ref: ref,
      );

    case ExerciseType.fixedTime:
      return ActionExerciseFixedWidget(
        exercise: exercise,
        ref: ref,
      );

    default:
      return Container();
  }
}

class ActionExerciseWidget extends StatelessWidget {
  const ActionExerciseWidget({
    Key? key,
    required this.exercise,
    required this.ref,
  }) : super(key: key);

  final Exercise? exercise;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    // final timeLeft = ref.watch(actionWorkoutProvider).timerDuration;
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
              child: const Center(child: Text('Exercise')),
            ),
            addVerticalSpace(20),
            // showExerciseStateText(exercise!.exerciseState),
            const Baseline(
              baseline: 90,
              baselineType: TextBaseline.alphabetic,
              child: TimerTextWidget(
                timeLeft: 60,
              ),
            ),

            addVerticalSpace(10),
            Text(
              // '${exercise!.reps}/${exercise!.initialReps}',
              '23442',
              style: Theme.of(context).textTheme.headline2,
            ),
            addVerticalSpace(20),
          ],
        ),
      ],
    );
  }
}

Widget showExerciseStateText(ExerciseState exerciseState) {
  switch (exerciseState) {
    case ExerciseState.initial:
      return const CBText.headline1(text: 'Prepare');
    case ExerciseState.hanging:
      return const CBText.headline1(text: 'Hanging');
    case ExerciseState.resting:
      return const CBText.headline1(text: 'Resting');
    default:
      return const CBText.headline1(text: 'What The F');
  }
}

class ActionExerciseFixedWidget extends StatelessWidget {
  const ActionExerciseFixedWidget({
    super.key,
    required this.exercise,
    required this.ref,
  });
  final WidgetRef ref;
  final Exercise? exercise;

  @override
  Widget build(BuildContext context) {
    // final timeLeft = ref.watch(actionWorkoutProvider).timerDuration;
    // final workoutState = ref.watch(actionWorkoutProvider).workoutState;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(child: Text('ExerciseFixed')),
        ),
        addVerticalSpace(20),

        const Baseline(
          baseline: 90,
          baselineType: TextBaseline.alphabetic,
          child: TimerTextWidget(
            timeLeft: 60,
          ),
        ),
        addVerticalSpace(10),
        // workoutState == WorkoutState.pausedAfterExerciseFixed
        //     ? TextButton(
        //         onPressed: () {
        //           ref.read(actionWorkoutProvider.notifier).resumeWorkoutAfterExerciseFixed();
        //         },
        //         child: Text('Continue'),
        //       )
        //    : ButtonsContainer(),
        // addVerticalSpace(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text('Start after finish ${exercise!.startAfterFinish}'),
              Text('Start after finish 34'),
              Switch(
                // value: exercise!.startAfterFinish,
                value: false,
                onChanged: (value) {
                  // ref.read(actionWorkoutProvider.notifier).toggleExerciseFixedOnFinish();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

//! In case we want to add exercise as a rest. It's optional
// class ActionRestWidget extends StatelessWidget {
//   const ActionRestWidget({
//     Key? key,
//     required this.ref,
//   }) : super(key: key);
//   final WidgetRef ref;
//   @override
//   Widget build(BuildContext context) {
//     final timeLeft = ref.watch(actionWorkoutProvider).timerDuration;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: double.infinity,
//           height: Dimensions.height45,
//           child: const Center(child: Text('Rest')),
//           color: Colors.black12,
//         ),
//         addVerticalSpace(Dimensions.height20),
//         Text(
//           'Resting ',
//           style: Theme.of(context).textTheme.headline3,
//         ),
//         Baseline(
//           baseline: 90,
//           baselineType: TextBaseline.alphabetic,
//           child: TimerTextWidget(
//             timeLeft: timeLeft,
//           ),
//         ),
//         addVerticalSpace(10),
//         const ButtonsContainer(),
//       ],
//     );
//   }
// }
