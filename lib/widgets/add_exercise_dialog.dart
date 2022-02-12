import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:my_first_riverpod/utils/dimensions.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/image_preview.dart';
import 'package:my_first_riverpod/widgets/test_button_widget.dart';

class AddExerciseDialog extends ConsumerWidget {
  AddExerciseDialog({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final exercise = ref.watch(exerciseProvider);

    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Exercise Name',
          ),
          onChanged: (value) {
            ref.watch(exerciseProvider.notifier).setName(value);
          }),
      ItemsButtonWidget(
        title: 'Preparation Time ${exercise.prepareTime}',
        pickerType: PickerType.exercisePrepareTime,
        onChanged: (value) {
          ref.read(exerciseProvider.notifier).setPrepareTime(value);
        },
        onPressed: () => Navigator.of(context).pop(),
      ),
      ItemsButtonWidget(
        title: 'Hang Time ${exercise.hangingTime}',
        pickerType: PickerType.exerciseHangTime,
        onChanged: (value) {
          ref.read(exerciseProvider.notifier).setHanginTime(value);
        },
        onPressed: () => Navigator.of(context).pop(),
      ),
      ItemsButtonWidget(
        title: 'Rest Time ${exercise.restingTime}',
        pickerType: PickerType.exerciseRestTime,
        onChanged: (value) {
          ref.read(exerciseProvider.notifier).setRestingTime(value);
        },
        onPressed: () => Navigator.of(context).pop(),
      ),
      ItemsButtonWidget(
        title: 'Reps ${exercise.reps}',
        pickerType: PickerType.exerciseReps,
        onChanged: (value) {
          ref.read(exerciseProvider.notifier).setNumberOfReps(value);
        },
        onPressed: () => Navigator.of(context).pop(),
      ),
      addVerticalSpace(10),
      ItemsButtonWidget(
        title: 'Rest After Exercise ${exercise.restAfterExercise}',
        pickerType: PickerType.exerciseRestAfter,
        onChanged: (value) {
          ref.read(exerciseProvider.notifier).setRestAfter(value);
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
          ref.read(exerciseProvider.notifier).takePicture();
          //todo call add picture function
        },
      ),
      if (exercise.imageUrl != null)
        Expanded(
            child: ImagePreview(
          path: exercise.imageUrl!,
        )),
         Align(
        alignment: Alignment.center,
        child: FloatingActionButton.extended(
        label: const Text('Add Exercise'),
        onPressed: () {
          ref.read(workoutProvider.notifier).addExerciseRepeatersType(exercise);
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Exercise Added'),
            duration: Duration(milliseconds: 400),
          ));
        },
        tooltip: 'Add Exercise',
      ),
      ),
      
      addVerticalSpace(20),
    ],
    );
  }
}
