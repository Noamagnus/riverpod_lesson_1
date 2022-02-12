import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/image_preview.dart';
import 'package:my_first_riverpod/widgets/test_button_widget.dart';

class AddExerciseFixedDialog extends ConsumerWidget {
  const AddExerciseFixedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exercise = ref.watch(exerciseProvider);
    return Column(
      children: [
        addVerticalSpace(5),
        const Text('Add Estimated Time'),
        ItemsButtonWidget(
          pickerType: PickerType.exerciseFixedEstimatedTime,
          title: 'Estimated Time ${exercise.estimatedTime} sec',
          onChanged: (value) {
            ref.read(exerciseProvider.notifier).setEstimatedTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Continue after estimate'),
            Switch(
              value: ref.watch(exerciseProvider).startAfterFinish,
              onChanged: (value) {
                ref.read(exerciseProvider.notifier).setContinueOnFinish(value);
              },
            ),
          ],
        ),
        addVerticalSpace(10),
        ItemsButtonWidget(
          title: 'Reps ${exercise.reps}',
          pickerType: PickerType.exerciseFixedReps,
          onChanged: (value) {
            ref.read(exerciseProvider.notifier).setNumberOfReps(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        addVerticalSpace(10),
        const Text('Props'),
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
          ImagePreview(
            path: exercise.imageUrl!,
          ),
        Expanded(
          child: Container(),
        ),
        FloatingActionButton.extended(
          label: const Text('Add Exercise'),
          onPressed: () {
            ref.read(workoutProvider.notifier).addExerciseFixedTimeType(exercise);
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
