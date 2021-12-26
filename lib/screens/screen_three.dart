import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/timer_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:my_first_riverpod/providers/providers.dart';
import 'package:my_first_riverpod/providers/timer_notifier.dart';
import 'package:my_first_riverpod/widgets/buttons_container.dart';
import 'package:my_first_riverpod/widgets/timer_text_widget.dart';

class ThirdScreen extends ConsumerWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    final exercise = ref.watch(exerciseNotifierProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Text(
                  'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
              const SizedBox(
                height: 10,
              ),
              Text('Reps ${timerState.reps}'),
              if (timerState.timerExerciseState == TimerExerciseState.hangTime) ...[
                const Text('Hanging Time')
              ],
              if (timerState.timerExerciseState == TimerExerciseState.restTime) ...[
                const Text('Resting Time'),
              ],
              const SizedBox(
                height: 10,
              ),
              Text(exercise.imageUrl??'NO url'),
               const SizedBox(
                height: 10,
              ),
              Text(exercise.displayDetails.toString())
            ],
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Column(
                children: const [
                  TimerTextWidget(),
                  SizedBox(height: 20),
                  ButtonsContainer(),
                  SizedBox(
                    height: 100,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
