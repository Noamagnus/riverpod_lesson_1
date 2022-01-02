import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';
import 'package:my_first_riverpod/providers/settings_state_notifier.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:my_first_riverpod/repositiries/workoutDAO.dart';

class ListFromDatabase extends ConsumerWidget {
  const ListFromDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    print('build run');
    final workoutList = ref.watch(workoutDAOProvider).getAllWorkouts();
    final exerciseNotifier = ref.watch(exerciseNotifierProvider);
  

    return StreamBuilder(
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
                  child: Column(
                    children: [
                      ListTile(
                        key: Key('$index'),
                        title: Text(
                            'Hanging ${workout.dificultyLevel}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(workout.uuid)],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                ref.read(workoutDAOProvider).deleteWorkout(workout);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.expand_more),
                              onPressed: () {
                                ref.read(exerciseNotifierProvider.notifier).showDetails();
                                
                              },
                            ),
                          ],
                        ),
                      ),
                      if ( exerciseNotifier.displayDetails) ...[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: workout.exercises.map((exercise)=>Text(
                              'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'
                            )).toList(),)
                          
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