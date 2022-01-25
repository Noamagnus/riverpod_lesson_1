import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_fixed_provider.dart';
import 'package:my_first_riverpod/providers/workout_item_provider.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/test_button_widget.dart';

class AddExerciseFixedDialog extends ConsumerWidget {
  const AddExerciseFixedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exerciseFixed = ref.watch(exerciseFixedProvider);
    return Column(
      children: [
        addVerticalSpace(5),
        const Text('Add Estimated Time'),
        TestButtonWidget(
          pickerType: PickerType.exerciseFixedEstimatedTime,
          title: 'Estimated Time ${exerciseFixed.estimatedTime} sec',
          onChanged: (value) {
            ref.read(exerciseFixedProvider.notifier).setEstimatedTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Continue after estimate'),
            Switch(
              value: ref.watch(exerciseFixedProvider).continueOnFinish,
              onChanged: (value) {
                ref.read(exerciseFixedProvider.notifier).setContinueOnFinishName();
              },
            ),
          ],
        ),
        addVerticalSpace(10),
        TestButtonWidget(
          title: 'Reps ${exerciseFixed.numberOfReps}',
          pickerType: PickerType.exerciseFixedReps,
          onChanged: (value) {
            ref.read(exerciseFixedProvider.notifier).setNumberOfReps(value);
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
            ref.read(exerciseFixedProvider.notifier).takePicture();
            //todo call add picture function
          },
        ),
        Expanded(
          child: Container(),
        ),
        FloatingActionButton.extended(
          label: const Text('Add Exercise'),
          onPressed: () {
            ref.read(workoutItemProvider.notifier).setAndAddExerciseFixed(exerciseFixed);
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
