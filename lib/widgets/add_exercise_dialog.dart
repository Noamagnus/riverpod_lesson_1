import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/workout_provider.dart';
import 'package:my_first_riverpod/providers/workout_item_provider.dart';
import 'package:my_first_riverpod/repositiries/exerciseDAO.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/custom_button_widget.dart';
import 'package:numberpicker/numberpicker.dart';

class AddExerciseDialog extends ConsumerWidget {
  AddExerciseDialog({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final exercise = ref.watch(exerciseProvider);

    return Column(
      children: [
        TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Exercise Name',
            ),
            onChanged: (value) {
              print(value);
              ref.watch(exerciseProvider.notifier).setName(value);
            }),
        HangTimeButtonWidget(
          title: 'Hang Time ${exercise.hangingTime}',
          // value: ref.watch(exerciseNotifierProvider).hangingTime,
          onChanged: (value) {
            ref.read(exerciseProvider.notifier).setHanginTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        RestTimeButtonWidget(
          title: 'Rest Time ${exercise.restingTime}',
          // value: ref.watch(exerciseNotifierProvider).restingTime,
          onChanged: (value) {
            ref.read(exerciseProvider.notifier).setRestingTime(value);
          },
          onPressed: () => Navigator.of(context).pop(),
        ),
        RepsButtonWidget(
          title: 'Reps ${exercise.reps}',
          // value: ref.watch(exerciseNotifierProvider).reps,
          onChanged: (value) {
            ref.read(exerciseProvider.notifier).setNumberOfReps(value);
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
        Expanded(
          child: Container(),
        ),
        FloatingActionButton.extended(
          label: const Text('Add Exercise'),
          onPressed: () {
            //todo here I only save exercise to workoutItemNotifier but im not saving it
            //figure out how to save it to Workout2notifier
            ref.read(workoutItemProvider.notifier).setExercise(exercise);
            final item = ref.read(workoutItemProvider.notifier).getWorkoutItem();
            ref.read(workoutProvider.notifier).addWorkoutItem(item);
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
