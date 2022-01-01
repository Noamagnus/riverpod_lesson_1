import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:my_first_riverpod/providers/settings_state_notifier.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';

class ExerciseListScreen extends ConsumerWidget {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    print('build run');
    final exerciseList = ref.watch(exerciseDAOProvider).getAllExercises2();
    final exerciseNotifier = ref.watch(exerciseNotifierProvider);
    

    return StreamBuilder(
      stream: exerciseList,
      initialData: const [],
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final List<Exercise> list = snapshot.data;

            return ReorderableListView.builder(
              onReorder: (int oldIndex, int newIndex) {
                ref.read(exerciseDAOProvider).onReorder(
                      oldIndex,
                      newIndex,
                    );
              },
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final exercise = list[index];
                return InkWell(
                  key: Key('$index'),
                  onTap: () {
                    ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
                    // ref.read()
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                            'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('${exercise.uuid} index $index')],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                ref.read(exerciseDAOProvider).deleteExercise(exercise);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.expand_more),
                              onPressed: () {
                                print(exerciseNotifier.displayDetails);
                                ref.read(exerciseNotifierProvider.notifier).showDetails();
                              },
                            ),
                          ],
                        ),
                      ),
                      if (exercise.imageUrl != null && exerciseNotifier.displayDetails) ...[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.file(
                              File(exercise.imageUrl!),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                );
              },
            );
          } else {
            return Text('no data');
          }
        } else {
          return const Text('ne znam bato');
        }
      },
    );
  }
}



