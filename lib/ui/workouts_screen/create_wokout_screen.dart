import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:my_first_riverpod/repositories/workout2DAO.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';
import 'package:my_first_riverpod/widgets/horizontal_item_selector.dart';
import 'package:my_first_riverpod/widgets/workout_tile_header.dart';

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
      backgroundColor: Colors.lightGreen.shade100,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Workout Name',
                    ),
                    onChanged: (value) {
                      // ref.watch(workoutProvider.notifier).setName(value);
                    }),
              ),
              // const HorizontalItemsSelector(),
              const Expanded(child: ReordableList()),
            ],
          ),
        ),
      ),
      floatingActionButton: isFabVisible
          ? Consumer(
              builder: (context, ref, child) {
                // final workout = ref.watch(workoutProvider);
                final workout = Workout.initial();

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

class ReordableList extends HookConsumerWidget {
  const ReordableList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final workout = ref.watch(workoutProvider);
    final workout = Workout.initial();

    return ReorderableListView.builder(
      onReorder: (int oldIndex, int newIndex) {
        // ref.read(workoutProvider.notifier).onReorder(oldIndex, newIndex);
      },
      itemCount: workout.listOfExercises.length,
      itemBuilder: (BuildContext context, int index) {
        final item = workout.listOfExercises[index];
        return _workoutItemSelector(item, index, ref);
      },
    );
  }
}

Widget _workoutItemSelector(Exercise exercise, int index, WidgetRef ref) {
  switch (exercise.exerciseType) {
    case ExerciseType.repeaters:
      return ExerciseListTile(
        key: ValueKey(index),
        exercise: exercise,
        index: index,
        ref: ref,
      );
   
    case ExerciseType.fixedTime:
      return ExerciseFixedListTile(
        key: ValueKey(index),
        exercise: exercise,
        index: index,
        ref: ref,
      );
    default:
      return Container();
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
    // final exercise = workoutItem.exercise;
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
        child: CBContainer(
          child: Column(
            children: [
              const WorkoutTileHeader(
                title: 'Exercise',
              ),
              ListTile(
                title: Text(exercise.name ?? 'No name'),
                // subtitle: Text(
                //     'Hanging ${exercise.hangingTime} Resting ${exercise?.restingTime} Reps ${exercise?.reps} '),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // ref.read(workoutProvider.notifier).deleteExercise(exercise);
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
              // if (exercise.imageUrl != null && exercise.showDetails== true) ...[
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     //todo fix this sizedBox
              //     child: Container(),
              //     // child: SizedBox(
              //     //   height: 200,
              //     //   width: double.infinity,
              //     //   child: Image.file(
              //     //     File(exercise?.imageUrl),
              //     //     fit: BoxFit.cover,
              //     //     width: double.infinity,
              //     //   ),
              //     // ),
              //   )
              // ],
            ],
          ),
        ),
      ),
    );
  }
}

// 

class ExerciseFixedListTile extends StatelessWidget {
  const ExerciseFixedListTile({
    Key? key,
    required this. exercise ,
    required this.index,
    required this.ref,
  }) : super(key: key);

  final Exercise  exercise ;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    // final exerciseFixed = workoutItem.exerciseFixed;
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
        child: CBContainer(
          child: Column(
            children: [
              const WorkoutTileHeader(
                title: 'ExerciseFixed',
              ),
              ListTile(
                title: Text(exercise.name ?? 'No name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //   Text(
                  //       'Estimated time ${exercise.estimatedTime}'),
                  // Text('Continue on finish ${exercise.startAfterFinish}'),
                  // Text('Repetitions ${exercise.reps}')
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // ref.read(workoutProvider.notifier).deleteExercise(exercise);
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
              // if (exercise.imageUrl != null && exercise.showDetails == true) ...[
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     //todo fix this sizedBox
              //     child: Container(),
              //     // child: SizedBox(
              //     //   height: 200,
              //     //   width: double.infinity,
              //     //   child: Image.file(
              //     //     File(exercise?.imageUrl),
              //     //     fit: BoxFit.cover,
              //     //     width: double.infinity,
              //     //   ),
              //     // ),
              //   )
              // ],
            ],
          ),
        ),
      ),
    );
  }
}



// if (item.workoutItemState == WorkoutItemState.exercise) {
        //   return ExerciseListTile(
        //     key: ValueKey(index),
        //     workoutItem: item,
        //     index: index,
        //     ref: ref,
        //   );
        // } else if (item.workoutItemState == WorkoutItemState.rest) {
        //   return RestTile(
        //     key: ValueKey(index),
        //     workoutItem: item,
        //     index: index,
        //     ref: ref,
        //   );
        // } else {
        //   return Container();
        // }

        // class RestTile extends StatelessWidget {
//   const RestTile({
//     Key? key,
//     required this.workoutItem,
//     required this.index,
//     required this.ref,
//   }) : super(key: key);

//   final WorkoutItem workoutItem;
//   final int index;
//   final WidgetRef ref;

//   @override
//   Widget build(BuildContext context) {
//     final restItem = workoutItem?.rest;
//     return InkWell(
//       key: key,
//       onTap: () {
//         // ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 8,
//           vertical: 4,
//         ),
//         child: BorderBox(
//           padding: EdgeInsets.only(top: 0),
//           child: Column(
//             children: [
//               const WorkoutTileHeader(
//                 title: 'Rest',
//               ),
//               ListTile(
//                 title: Text('Rest time is ${restItem?.restTime} sec'),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         ref.read(workoutProvider.notifier).deleteExercise(workoutItem);
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.expand_more),
//                       onPressed: () {
//                         //todo add toogle exercise function
//                         // ref.read(workout2NotifierProvider.notifier).toggleWorkoutItemDetails(exercise);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }