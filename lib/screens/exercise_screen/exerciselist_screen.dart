import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/repositories/exerciseDAO.dart';
import 'package:my_first_riverpod/widgets/add_exercise_widget.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';

class ExerciseListScreen extends ConsumerWidget {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    print('build run');
    final exerciseList = ref.watch(exerciseDAOProvider).getAllExercises2();
    final exerciseNotifier = ref.watch(exerciseProvider);

    return Scaffold(
      body: StreamBuilder(
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
                  return ExerciseListTile(
                    key: Key('$index'),
                    exercise: exercise,
                    index: index,
                    ref: ref,
                  );
                },
              );
            } else {
              return const Text('no data');
            }
          } else {
            return const Text('ne znam bato');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                // final _value = ref.watch(exerciseProvider).hangingTime;
                return const Dialog(
                  child: AddExercise2Widget(),
                );
              });
        },
      ),
    );
  }
}

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile({
    Key? key,
    required this.exercise,
    required this.index,
    required this.ref,
  }) : super(key: key);

  final Exercise exercise;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: () {
        ref.read(exerciseProvider.notifier).selectExerciseFromList(exercise);
        // ref.read()
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: BorderBox(
          child: Column(
            children: [
              ListTile(
                title: Text(
                    'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
                subtitle: Text('${exercise.showDetails} index $index'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(exerciseDAOProvider).deleteExercise(exercise);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.expand_more),
                      onPressed: () {
                        ref.read(exerciseDAOProvider).toggleDetails(exercise);
                      },
                    ),
                  ],
                ),
              ),
              if (exercise.imageUrl != null && exercise.showDetails) ...[
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
        ),
      ),
    );
  }
}
