import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_first_riverpod/data/constants/route_names.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/ui/exercise_list_page/bloc/exercise_list_bloc.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';




class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseListBloc, ExerciseListState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Exercises'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ReorderableListView.builder(
            onReorder: (int oldIndex, int newIndex) {
              // ref.read(exerciseDAOProvider).onReorder(
              //   oldIndex,
              //   newIndex,
              // );
            },
            itemCount: state.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              final exercise = state.exercises[index];
              return ExerciseListTile(
                key: Key('$index'),
                exercise: exercise,
                index: index,
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushNamed(RouteNames.addExercise);
            },
          ),
        );
      },
    );
  }
}

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile({
    super.key,
    required this.exercise,
    required this.index,
  });

  final Exercise exercise;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: () {
        // ref.read(exerciseProvider.notifier).selectExerciseFromList(exercise);
        // ref.read()
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: CBContainer(
          child: Column(
            children: [
              ListTile(
                title: Text('Hanging ${(exercise  as ExerciseRepeaters).hangingTime} Resting ${(exercise as ExerciseRepeaters).restingTime} Reps ${(exercise  as ExerciseRepeaters).reps}'),
                subtitle: Text('${(exercise as ExerciseRepeaters).showDetails} index $index'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<ExerciseListBloc>().add(DeleteExercise(exercise: exercise));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.expand_more),
                      onPressed: () {
                        // ref.read(exerciseDAOProvider).toggleDetails(exercise);
                      },
                    ),
                  ],
                ),
              ),
              // if (exercise.imageUrl != null && exercise.showDetails) ...[
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: SizedBox(
              //       height: 200,
              //       width: double.infinity,
              //       child: Image.file(
              //         File(exercise.imageUrl!),
              //         fit: BoxFit.cover,
              //         width: double.infinity,
              //       ),
              //     ),
              //   )
              // ],
            ],
          ),
        ),
      ),
    );
  }
}
