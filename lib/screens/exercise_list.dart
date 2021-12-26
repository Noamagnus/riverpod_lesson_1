import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_list_notifier.dart';
import 'package:my_first_riverpod/providers/exercise_state_notifier.dart';

class ExerciseListScreen extends ConsumerWidget {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exerciseList = ref.watch(exerciseListProvider);
    return ExerciseListView(exerciseList: exerciseList);
  }
}

class ExerciseListView extends StatefulWidget {
  const ExerciseListView({
    Key? key,
    required this.exerciseList,
  }) : super(key: key);

  final List<Exercise> exerciseList;

  @override
  State<ExerciseListView> createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  void onReorder(int oldIndex, int newIndex) {
    final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final item = widget.exerciseList.removeAt(oldIndex);
    widget.exerciseList.insert(newIdx, item);
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      onReorder: onReorder,
      itemCount: widget.exerciseList.length,
      itemBuilder: (BuildContext context, int index) {
        final exercise = widget.exerciseList[index];
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return InkWell(
              onTap: () {
                ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(exercise);
                // ref.read()
              },
              child: ListTile(
                key: ValueKey(index+1

         

                ),
               
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
      },
    );
  }
}
