
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/workout_item_model.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:my_first_riverpod/repositiries/workout2DAO.dart';
import 'package:my_first_riverpod/widgets/add_exercise_dialog.dart';
import 'package:my_first_riverpod/widgets/add_rest_dialog.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';
import 'package:my_first_riverpod/widgets/information_tile.dart';

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
              const Text('Create Workout Screen'),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Workout Name',
                        ),
                        onChanged: (value) {
                          ref.watch(workoutProvider.notifier).setName(value);
                        }),
                  );
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: AddExerciseDialog(),
                              );
                            });
                      },
                      child: const InformationTile(
                        content: "Exercise",
                        name: "Exercise",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: AddRestDialog(),
                              );
                            });
                      },
                      child: const InformationTile(
                        content: "Rest",
                        name: "Rest",
                      ),
                    ),
                    InformationTile(
                      content: "${["bathrooms"]}",
                      name: "ExerciseFixed",
                    ),
                    InformationTile(
                      content: "${["garage"]}",
                      name: "Other",
                    ),
                    addHorizontalSpace(25),
                  ],
                ),
              ),
              const Expanded(child: ReordableList2()),
            ],
          ),
        ),
      ),
      floatingActionButton: isFabVisible
          ? Consumer(
              builder: (context, ref, child) {
                final workout = ref.watch(workoutProvider);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton.extended(
                      heroTag: 'btn3',
                      label: const Text('Save Workout'),
                      onPressed: () {
                        ref.read(workout2DAOProvider).saveWorkout(workout);
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

class ReordableList2 extends HookConsumerWidget {
  const ReordableList2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutItem = ref.watch(workoutProvider);

    return ReorderableListView.builder(
      onReorder: (int oldIndex, int newIndex) {
        ref.read(workoutProvider.notifier).onReorder(oldIndex, newIndex);
      },
      itemCount: workoutItem.workoutItems.length,
      itemBuilder: (BuildContext context, int index) {
        final item = workoutItem.workoutItems[index];
        if (item.workoutItemState == WorkoutItemState.exercise) {
          return ExerciseListTile2(
            key: ValueKey(index),
            workoutItem: item,
            index: index,
            ref: ref,
          );
        } else if (item.workoutItemState == WorkoutItemState.rest) {
          return RestTile(
            key: ValueKey(index),
            workoutItem: item,
            index: index,
            ref: ref,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ExerciseListTile2 extends StatelessWidget {
  const ExerciseListTile2({
    Key? key,
    required this.workoutItem,
    required this.index,
    required this.ref,
  }) : super(key: key);

  final WorkoutItem workoutItem;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final exercise = workoutItem?.exercise;
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
                title: Text('${exercise?.name}'),
                subtitle: Text(
                    'Hanging ${exercise?.hangingTime} Resting ${exercise?.restingTime} Reps ${exercise?.reps} ${workoutItem?.uuid}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(workoutProvider.notifier).deleteWorkoutItem(workoutItem);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.expand_more),
                      onPressed: () {
                        //todo add toogle exercise function
                        // ref.read(workout2NotifierProvider.notifier).toggleWorkoutItemDetails(exercise);
                      },
                    ),
                  ],
                ),
              ),
              if (exercise?.imageUrl != null && exercise?.displayDetails == true) ...[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  //todo fix this sizedBox
                  child: Container(),
                  // child: SizedBox(
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: Image.file(
                  //     File(exercise?.imageUrl),
                  //     fit: BoxFit.cover,
                  //     width: double.infinity,
                  //   ),
                  // ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class RestTile extends StatelessWidget {
  const RestTile({
    Key? key,
    required this.workoutItem,
    required this.index,
    required this.ref,
  }) : super(key: key);

  final WorkoutItem workoutItem;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final restItem = workoutItem?.rest;
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
                title: Text('Rest time is ${restItem?.restTime} sec'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(workoutProvider.notifier).deleteWorkoutItem(workoutItem);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.expand_more),
                      onPressed: () {
                        //todo add toogle exercise function
                        // ref.read(workout2NotifierProvider.notifier).toggleWorkoutItemDetails(exercise);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
