import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exerciseNotifierProvider.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/custom_button_widget.dart';
import 'package:numberpicker/numberpicker.dart';

class AddExerciseScreen extends ConsumerWidget {
  AddExerciseScreen({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final exercise = ref.watch(exerciseNotifierProvider);

    return Column(
      children: [
        TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Exercise Name',
            ),
            onChanged: (value) {
              print(value);
              ref.watch(exerciseNotifierProvider.notifier).setName(value);
            }),
        HangTimeButtonWidget(
          title: 'Hang Time ${exercise.hangingTime}',
          // value: ref.watch(exerciseNotifierProvider).hangingTime,
          onChanged: (value) {
            ref.read(exerciseNotifierProvider.notifier).setHanginTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        RestTimeButtonWidget(
          title: 'Rest Time ${exercise.restingTime}',
          // value: ref.watch(exerciseNotifierProvider).restingTime,
          onChanged: (value) {
            ref.read(exerciseNotifierProvider.notifier).setRestingTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        RepsButtonWidget(
          title: 'Reps ${exercise.reps}',
          // value: ref.watch(exerciseNotifierProvider).reps,
          onChanged: (value) {
            ref.read(exerciseNotifierProvider.notifier).setNumberOfReps(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        addVerticalSpace(10),
        TextButton(
          child: Text(
            'Take Picture',
            style: Theme.of(context).textTheme.headline5,
          ),
          onPressed: () {
            ref.read(exerciseNotifierProvider.notifier).takePicture();
            //todo call add picture function
          },
        ),
        Expanded(
          child: Container(),
        ),
        FloatingActionButton.extended(
          label: const Text('Add Exercise'),
          onPressed: () {
            print(exercise);
            // ref.read(workoutNotifierProvider.notifier).addExercise(exercise);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Exercise Added'),
              duration: Duration(milliseconds: 400),
            ));
          },
          tooltip: 'Add Exercise',
        ),
        addVerticalSpace(20),
      ],
    );
  }
}
