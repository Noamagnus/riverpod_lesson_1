import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:my_first_riverpod/providers/selectedWorkout_provider.dart';
import 'package:my_first_riverpod/providers/settings_state_notifier.dart';
import 'package:my_first_riverpod/providers/workout_state_notifier.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:my_first_riverpod/repositiries/workoutDAO.dart';
import 'package:my_first_riverpod/screens/action_screen.dart';
import 'package:my_first_riverpod/screens/add_workout_screen.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';

class WorkoutsListScreen extends ConsumerWidget {
  const WorkoutsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    print('build run');
    final workoutList = ref.watch(workoutDAOProvider).getAllWorkouts();
    final exerciseNotifier = ref.watch(exerciseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder(
        stream: workoutList,
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
              final List<Workout> list = snapshot.data;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final workout = list[index];
                  return InkWell(
                    onTap: () {
                      // ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(workout);
                      // ref.read()
                    },
                    child: BorderBox(
                      child: Column(
                        children: [
                          ListTile(
                            key: Key('$index'),
                            title: Text(
                                'Hanging ${workout.dificultyLevel} showDetails ${workout.showDetails}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('')],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.play),
                                  onPressed: () {
                                    ref
                                        .read(selectedWorkoutNotifierProvider.notifier)
                                        .selectWorkoutFromList(workout);
                                    // ref.read(workoutDAOProvider).deleteWorkout(workout);
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const ActionScreen()));
                                  },
                                ),
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.trash),
                                  onPressed: () {
                                    ref.read(workoutDAOProvider).deleteWorkout(workout);
                                  },
                                ),
                                IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.ellipsisV),
                                  onPressed: () {
                                    // ref.read(exerciseNotifierProvider.notifier).showDetails();
                                    ref.read(workoutDAOProvider).toggleDetails(workout);
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (workout.showDetails) ...[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: workout.exercises
                                    .map((exercise) => Text(
                                        'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'))
                                    .toList(),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
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
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'btn1',
        label: const Text('Add Workout'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateWorkoutScreen(),
            ),
          );
        },
      ),
    );
  }
}



//   @override
//   Widget build(BuildContext context, ref) {
//     print('build run');
//     final exerciseList = ref.watch(exerciseDAOProvider).getAllExercises2();

//     return FutureBuilder(
//       future: exerciseList,
//       // initialData: InitialData,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           final list = snapshot.data as List<Exercise>;
//           return ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (BuildContext context, int index) {
//               final exercise = list[index];
//               print(exercise);
//               return InkWell(
//                 onTap: () {
//                   ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
//                   // ref.read()
//                 },
//                 child: ListTile(
//                   title: Text(
//                       'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
//                   subtitle: Text(exercise.uuid),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       ref.read(exerciseDAOProvider).deleteExercise(exercise);
//                       // await ref.read(exerciseDAOProvider).getAllExercise();
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         } else if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: const CircularProgressIndicator());
//         } else {
//           return const Text('ne znam bato');
//         }
//       },
//     );
//   }
// }

// ListView.builder(
//       itemCount: exerciseList.length,
//       itemBuilder: (BuildContext context, int index) {
//         final exercise = exerciseList[index];
//         return InkWell(
//           onTap: () {
//             ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
//             // ref.read()
//           },
//           child: ListTile(
//             title: Text(
//                 'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
//             subtitle: Text(exercise.uuid),
//           ),
//         );
//       },
//     );