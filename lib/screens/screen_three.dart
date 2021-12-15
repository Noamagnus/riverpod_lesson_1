import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/timer_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/providers.dart';
import 'package:my_first_riverpod/providers/timer_notifier.dart';
import 'package:my_first_riverpod/widgets/buttons_container.dart';
import 'package:my_first_riverpod/widgets/timer_text_widget.dart';

class ThirdScreen extends ConsumerWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Text('Reps ${timerState.reps}'),
              if (timerState.timerExerciseState == TimerExerciseState.hangTime) ...[
                const Text('Hanging Time')
              ],
              if (timerState.timerExerciseState == TimerExerciseState.restTime) ...[
                const Text('Resting Time'),
              ]
            ],
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Column(
                children: [
                  const TimerTextWidget(),
                  const SizedBox(height: 20),
                  const ButtonsContainer(),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        child: const Text('Initial 5'),
                        onPressed: () {},
                        // onPressed: () => ref.read(timerProvider.notifier).start(5),
                      ),
                      TextButton(
                        child: const Text('Exercise Notifier'),
                        onPressed: () => ref.read(timerProvider.notifier).start(),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
