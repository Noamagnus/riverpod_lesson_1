import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:my_first_riverpod/providers/exercise_provider.dart';

class ItemsButtonWidget extends StatelessWidget {
  final String title;
  final PickerType pickerType;
  final void Function(int) onChanged;
  final void Function() onPressed;
  const ItemsButtonWidget({
    Key? key,
    required this.title,
    required this.pickerType,
    required this.onChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Consumer(
                  builder: (context, ref, child) => AlertDialog(
                        content: _pickerSelector(pickerType, ref, onChanged),
                        actions: [
                          TextButton(
                            onPressed: onPressed,
                            child: const Text('OK'),
                          )
                        ],
                      ));
            });
      },
    );
  }
}

enum PickerType {
  rest,
  exercisePrepareTime,
  exerciseRestTime,
  exerciseHangTime,
  exerciseReps,
  exerciseRestAfter,
  exerciseFixedEstimatedTime,
  exerciseFixedReps,
}

Widget _pickerSelector(PickerType type, WidgetRef ref, Function(int) onChanged) {
  switch (type) {
    case PickerType.rest:
      return NumberPicker(
        value: ref.watch(exerciseProvider).restingTime,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
    case PickerType.exerciseFixedEstimatedTime:
      return NumberPicker(
        value: ref.watch(exerciseProvider).estimatedTime,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
    case PickerType.exerciseFixedReps:
      return NumberPicker(
        value: ref.watch(exerciseProvider).reps,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exercisePrepareTime:
      return NumberPicker(
        value: ref.watch(exerciseProvider).prepareTime,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseHangTime:
      return NumberPicker(
        value: ref.watch(exerciseProvider).hangingTime,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseRestTime:
      return NumberPicker(
        value: ref.watch(exerciseProvider).restingTime,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseReps:
      return NumberPicker(
        value: ref.watch(exerciseProvider).reps,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseRestAfter:
      return NumberPicker(
        value: ref.watch(exerciseProvider).restAfterExercise,
        minValue: 0,
        maxValue: 20,
        onChanged: onChanged,
      );
    
    
    default:
      return const Text('Picker not found');
  }
}
