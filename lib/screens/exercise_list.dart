import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_list_notifier.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';

class ExerciseListScreen extends ConsumerWidget {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exerciseList = ref.watch(exerciseListProvider);
    return ListView.builder(
      itemCount: exerciseList.length,
      itemBuilder: (BuildContext context, int index) {
        final exercise = exerciseList[index];
        return InkWell(
          onTap: () {
            ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
            // ref.read()
          },
          child: ListTile(
            title: Text(
                'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.uuid),
                Text(exercise.imageUrl ?? 'Nema slike'),
              ],
            ),
          ),
        );
      },
    );
  }
}
