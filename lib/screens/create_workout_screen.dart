import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exerciseNotifierProvider.dart';
import 'package:my_first_riverpod/providers/settings_state_notifier.dart';
import 'package:my_first_riverpod/providers/workout_state_notifier.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:my_first_riverpod/repositiries/workoutDAO.dart';
import 'package:my_first_riverpod/screens/add_exercise_screen.dart';
import 'package:my_first_riverpod/widgets/add_exercise_widget.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isFabVisible = true;
            });
          } else if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isFabVisible = false;
            });
          }
          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              Text('Create Workout Screen'),
             Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) { 
               return  Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: TextField(
                  
                  decoration: const InputDecoration(
                    hintText: 'Enter Workout Name',
                  ),
                  onChanged: (value) {
                    ref.watch(workoutNotifierProvider.notifier).setName(value);
                  }),
               );
              },),

              Expanded(child: const ReordableList()),
            ],
          ),
        ),
      ),
      floatingActionButton: isFabVisible
          ? Consumer(
              builder: (context, ref, child) {
                final workout = ref.watch(workoutNotifierProvider);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton.extended(
                      heroTag: 'btn2',
                      label: const Text('Add Exercise'),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: AddExerciseScreen(),
                              );
                            });
                      },
                    ),
                    FloatingActionButton.extended(
                      heroTag: 'btn3',
                      label: const Text('Save Workout'),
                      onPressed: () {
                        ref.read(workoutDAOProvider).saveWorkout(workout);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Workout Saved to DB'),
                          duration: Duration(milliseconds: 400),
                        ));
                      },
                    )
                  ],
                );
              },
            )
          : null,
    );
  }
}

class ReordableList extends HookConsumerWidget {
  const ReordableList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workout = ref.watch(workoutNotifierProvider);

    return ReorderableListView.builder(
      onReorder: (int oldIndex, int newIndex) {
        ref.read(workoutNotifierProvider.notifier).onReorder(oldIndex, newIndex);
      },
      itemCount: workout.exercises.length,
      itemBuilder: (BuildContext context, int index) {
        final exercise = workout.exercises[index];
        return ExerciseListTile2(
          key: ValueKey(index),
          exercise: exercise,
          index: index,
          ref: ref,
        );
      },
    );
  }
}

// ListTile(
//           key: ValueKey(index),
//           title: Text(exercise.name??'No name'),
//           subtitle:  Text(
//             '$index Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}',
//           ),
//         );

class ExerciseListTile2 extends StatelessWidget {
  const ExerciseListTile2({
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
        // ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
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
                    '${exercise.name}'),
                subtitle: Text(
                    'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // ref.read(exerciseDAOProvider).deleteExercise(exercise);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.expand_more),
                      onPressed: () {
                        ref.read(workoutNotifierProvider.notifier).toggleExerciseDetails(exercise);
                      },
                    ),
                  ],
                ),
              ),
              if (exercise.imageUrl != null && exercise.displayDetails) ...[
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
