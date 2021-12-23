import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/helpers/image_picker.dart';
import 'package:my_first_riverpod/providers/exercise_list_notifier.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/providers.dart';
import 'package:my_first_riverpod/providers/sambast_database_provider.dart';
import 'package:my_first_riverpod/repositiries/transfer.dart';
import 'package:numberpicker/numberpicker.dart';

class SecondScreen extends HookConsumerWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercise = ref.watch(exerciseNotifierProvider);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      'Hang Time',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // final _value = ref.watch(exerciseProvider).hangingTime;
                            return AlertDialog(
                              content: Consumer(
                                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                  return NumberPicker(
                                    value: ref.watch(exerciseNotifierProvider).hangingTime,
                                    minValue: 1,
                                    maxValue: 20,
                                    onChanged: (value) {
                                      ref
                                          .read(exerciseNotifierProvider.notifier)
                                          .setHanginTime(value);
                                    },
                                  );
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                )
                              ],
                            );
                          });
                    },
                  ),
                  Text(
                    '${exercise.hangingTime} seconds',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      'Rest Time',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // final _value = ref.watch(exerciseProvider).hangingTime;
                            return AlertDialog(
                              content: Consumer(
                                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                  return NumberPicker(
                                    value: ref.watch(exerciseNotifierProvider).restingTime,
                                    minValue: 1,
                                    maxValue: 10,
                                    onChanged: (value) {
                                      ref
                                          .read(exerciseNotifierProvider.notifier)
                                          .setRestingTime(value);
                                    },
                                  );
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                )
                              ],
                            );
                          });
                    },
                  ),
                  Text(
                    '${exercise.restingTime} seconds',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      'Reps',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // final _value = ref.watch(exerciseProvider).hangingTime;
                            return AlertDialog(
                              content: Consumer(
                                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                  return NumberPicker(
                                    value: ref.watch(exerciseNotifierProvider).reps,
                                    minValue: 1,
                                    maxValue: 10,
                                    onChanged: (value) {
                                      ref
                                          .read(exerciseNotifierProvider.notifier)
                                          .setNumberOfReps(value);
                                    },
                                  );
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                )
                              ],
                            );
                          });
                    },
                  ),
                  Text(
                    exercise.reps.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Text(exercise.uuid),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text(
                'Take Picture',
                style: Theme.of(context).textTheme.headline5,
              ),
              onPressed: () {
                ref.read(exerciseNotifierProvider.notifier).takePicture();
                //todo call add picture function
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(exerciseListProvider.notifier).addExercise(exercise);
                ref.read(exerciseDAOProvider).saveExercise(exercise);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Exercise Added'),
                  duration: Duration(milliseconds: 400),
                ));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

// final car = ref.watch(carProvider);

// Slider(
//   onChanged: (value) {
//     ref.read(carProvider.notifier).doors(value);
//   },
//   value: car.doors!.toDouble(),
// ),
