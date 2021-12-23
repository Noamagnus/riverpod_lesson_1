import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_list_notifier.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/repositiries/transfer.dart';

class ListFromDatabase extends ConsumerWidget {
  const ListFromDatabase({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {
//     final exerciseList = ref.watch(futureDAOProvider);
//      return exerciseList.when(
//       data: (list) {
//         return ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (BuildContext context, int index) {
//             final exercise = list[index];
//             return InkWell(
//               onTap: () {
//                 ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
//                 // ref.read()
//               },
//               child: ListTile(
//                 title: Text(
//                     'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
//                 subtitle: Text(exercise.uuid),
//               ),
//             );
//           },
//         );
//       },
//       loading: () {
//         return const Center(child: CircularProgressIndicator());
//       },
//       error: (Object error, StackTrace? stackTrace) {
//         return Text('$error');
//       },

//     );
//   }
// }

  @override
  Widget build(BuildContext context, ref) {
    print('build run');
    final exerciseList = ref.watch(exerciseDAOProvider).getAllExercises2();

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

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final exercise = list[index];
                print(exercise);
                return InkWell(
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
                          children: [Text(exercise.uuid)],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            ref.read(exerciseDAOProvider).deleteExercise(exercise);
                            // await ref.read(exerciseDAOProvider).getAllExercise();
                          },
                        ),
                      ),
                      if(exercise.imageUrl!=null)...[
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