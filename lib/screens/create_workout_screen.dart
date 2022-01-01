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
            title: Text(exercise.name ?? 'No name'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add Exrcise'),
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
    );
  }
}
