import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:my_first_riverpod/providers/settings_state_notifier.dart';
import 'package:my_first_riverpod/providers/workout_state_notifier.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:my_first_riverpod/repositiries/workoutDAO.dart';
import 'package:my_first_riverpod/widgets/add_exercise_widget.dart';

class CreateWorkoutScreen extends ConsumerWidget {
  const CreateWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final workout = ref.watch(workoutNotifierProvider);

    return Scaffold(
        body: ReorderableListView.builder(
          onReorder: (int oldIndex, int newIndex) {},
          itemCount: workout.exercises.length,
          itemBuilder: (BuildContext context, int index) {
            final exercise = workout.exercises[index];
            return ListTile(
              key: ValueKey(index),
              title: Text(
                '$index Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}',
              ),
              subtitle: Text(exercise.uuid),
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.extended(
              label: const Text('Add Exercise'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // final _value = ref.watch(exerciseProvider).hangingTime;
                      return const Dialog(
                        child: AddExerciseWidget(),
                      );
                    });
              },
            ),
            FloatingActionButton.extended(
              label: const Text('Save'),
              onPressed: () {
                ref.read(workoutDAOProvider).saveWorkout(workout);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Workout Saved to DB'),
                    duration: Duration(milliseconds: 400),
                  ));
              },
            )
          ],
        ));
  }
}
