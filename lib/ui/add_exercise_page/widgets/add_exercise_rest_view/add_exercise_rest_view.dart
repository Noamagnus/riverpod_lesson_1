import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/data/enums/state_status_enum.dart';
import 'package:my_first_riverpod/repositories/exercise_repository.dart';
import 'package:my_first_riverpod/ui/add_exercise_page/widgets/add_exercise_rest_view/bloc/add_exercise_rest_bloc.dart';
import 'package:my_first_riverpod/widgets/text/cd_text.dart';
import 'package:numberpicker/numberpicker.dart';

class AddExerciseRestView extends StatelessWidget {
  const AddExerciseRestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExerciseRestBloc(exerciseRepo: context.read<ExerciseRepo>()),
      child: Builder(builder: (context) {
        return BlocConsumer<AddExerciseRestBloc, AddExerciseRestState>(
          listener: (context, state) {
            if(state.status == StateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: CBText.body(text: 'Exercise added', color: kColorPrimaryWhite),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: CBText.headline1(
                          text: 'Rest Time',
                        ),
                        onPressed: () {
                          final addExerciseBloc = context.read<AddExerciseRestBloc>();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider.value(
                                value: addExerciseBloc,
                                child: AlertDialog(
                                  content: Builder(builder: (context) {
                                    return NumberPicker(
                                      value: context.watch<AddExerciseRestBloc>().state.exercise.restTime,
                                      minValue: 0,
                                      maxValue: 10,
                                      onChanged: (value) {
                                        context.read<AddExerciseRestBloc>().add(
                                          EditExerciseRestEvent(restingTime: value),
                                        );
                                      },
                                    );
                                  }),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('OK'),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      CBText.headline1(
                        text: '${state.exercise.restTime} seconds',
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context.read<AddExerciseRestBloc>().add(SaveExerciseRest(exercise: state.exercise));
                    },
                    child: CBText.headline1(text: 'Save exercise')),
              ],
            );
            return SizedBox();
          },
        );
      }),
    );
  }
}
