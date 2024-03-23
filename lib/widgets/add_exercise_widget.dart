import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:numberpicker/numberpicker.dart';

class NewExercisePage extends StatelessWidget {
  const NewExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final exercise = ExerciseRepeaters.initial();
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
                            content: NumberPicker(
                              // value: ref.watch(exerciseProvider).hangingTime,
                              value: 2,
                              minValue: 1,
                              maxValue: 20,
                              onChanged: (value) {
                                // ref
                                //     .read(exerciseProvider.notifier)
                                //     .setHanginTime(value);
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
                            content: NumberPicker(
                              // value: ref.watch(exerciseProvider).restingTime,
                              value: 2,
                              minValue: 1,
                              maxValue: 10,
                              onChanged: (value) {
                                // ref
                                //     .read(exerciseProvider.notifier)
                                //     .setRestingTime(value);
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
                            content: NumberPicker(
                              // value: ref.watch(exerciseProvider).reps,
                              value: 2,
                              minValue: 1,
                              maxValue: 10,
                              onChanged: (value) {
                                // ref
                                //     .read(exerciseProvider.notifier)
                                //     .setNumberOfReps(value);
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
              // ref.read(exerciseProvider.notifier).takePicture();
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
                  // ref.read(exerciseDAOProvider).saveExercise(exercise);
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