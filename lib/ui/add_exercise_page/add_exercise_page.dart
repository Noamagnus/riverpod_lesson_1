import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/ui/add_exercise_page/bloc/add_exercise_bloc.dart';
import 'package:my_first_riverpod/ui/add_exercise_page/widgets/add_exercise_rest_view/add_exercise_rest_view.dart';
import 'package:my_first_riverpod/widgets/helper_widgets/spacers.dart';
import 'package:my_first_riverpod/widgets/horizontal_item_selector.dart';
import 'package:numberpicker/numberpicker.dart';

import 'widgets/add_exercise_repeaters_view/add_exercise_repeaters_view.dart';

class AddExercisePage extends StatelessWidget {
  const AddExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddExerciseBloc, AddExerciseState>(
      listener: (context, state) {
        // if (state.status == AddExerciseStateStatus.error) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Error: ${state.message}'),
        //       duration: const Duration(seconds: 5),
        //     ),
        //   );
        // }
        // if (state.status == AddExerciseStateStatus.success) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Success: ${state.message}'),
        //       duration: const Duration(seconds: 5),
        //     ),
        //   );
        // }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add New Exercise'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.lightGreen.shade200,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if(state.exerciseType == ExerciseTypeNew.repeaters)
                    AddExerciseRepeatersView(),
                  if(state.exerciseType == ExerciseTypeNew.fixedTime)
                    Text('Fixed Time'),
                  if(state.exerciseType == ExerciseTypeNew.rest)
                    AddExerciseRestView(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // context.read<AddExerciseBloc>().add(
                      //       SaveExerciseEvent(exercise: state.exercise),
                      //     );
                    },
                    tooltip: 'Add Exercise',
                    child: const Icon(Icons.add),
                  ),
                  const VerticalSpace(20),
                  HorizontalItemsSelector(
                    onSelected: (exerciseType) {
                      context.read<AddExerciseBloc>().add(
                            ExerciseTypeChangedEvent(exerciseType: exerciseType),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
