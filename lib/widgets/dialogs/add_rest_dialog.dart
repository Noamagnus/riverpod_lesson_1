import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/test_button_widget.dart';

class AddRestDialog extends ConsumerWidget {
  AddRestDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final exercise = ref.watch(exerciseProvider);
    final exercise = ExerciseRepeaters.initial();
    final rest = exercise.restingTime;
    return Column(
      children: [
        ItemsButtonWidget(
          title: 'Rest Time ${rest} sec',
          pickerType: PickerType.rest,
          onChanged: (value) {
            // ref.read(exerciseProvider.notifier).setRestingTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        addVerticalSpace(10),
        Expanded(
          child: Container(),
        ),
        FloatingActionButton.extended(
          label: const Text('Add Rest'),
          onPressed: () {
            // ref.read(exerciseProvider.notifier).setRestingTime(rest);
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
