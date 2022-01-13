import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exerciseNotifierProvider.dart';
import 'package:my_first_riverpod/providers/workout_state_notifier.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:numberpicker/numberpicker.dart';

class AddExercise2Widget extends ConsumerWidget {
  const AddExercise2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exercise = ref.watch(exerciseNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    'Hang Time',
                    style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.headline6,
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
                    style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.headline6,
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
                    style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          // Text(exercise.uuid),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            child: Text(
              'Take Picture',
              style: Theme.of(context).textTheme.headline6,
            ),
            onPressed: () {
              ref.read(exerciseNotifierProvider.notifier).takePicture();
              //todo call add picture function
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(exerciseDAOProvider).saveExercise(exercise);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Exercise Added'),
                    duration: Duration(milliseconds: 400),
                  ));
                },
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}