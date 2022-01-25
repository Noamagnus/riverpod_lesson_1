import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:my_first_riverpod/providers/exercise_fixed_provider.dart';
import 'package:my_first_riverpod/providers/exercise_provider.dart';
import 'package:my_first_riverpod/providers/rest_provider.dart';

class TestButtonWidget extends StatelessWidget {
  final String title;
  final PickerType pickerType;
  final void Function(int) onChanged;
  final void Function() onPressed;
  const TestButtonWidget({
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
  exerciseRestTime,
  exerciseHangTime,
  exerciseReps,
  exerciseFixedEstimatedTime,
  exerciseFixedReps,
}

Widget _pickerSelector(PickerType type, WidgetRef ref, Function(int) onChanged) {
  switch (type) {
    case PickerType.rest:
      return NumberPicker(
        value: ref.watch(restProvider).restTime,
        minValue: 1,
        maxValue: 20,
        onChanged: onChanged,
      );
    case PickerType.exerciseFixedEstimatedTime:
      return NumberPicker(
        value: ref.watch(exerciseFixedProvider).estimatedTime,
        minValue: 1,
        maxValue: 20,
        onChanged: onChanged,
      );
    case PickerType.exerciseFixedReps:
      return NumberPicker(
        value: ref.watch(exerciseFixedProvider).numberOfReps ?? 0,
        minValue: 1,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseHangTime:
      return NumberPicker(
        value: ref.watch(exerciseProvider).hangingTime,
        minValue: 1,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseRestTime:
      return NumberPicker(
        value: ref.watch(exerciseProvider).restingTime,
        minValue: 1,
        maxValue: 20,
        onChanged: onChanged,
      );
      case PickerType.exerciseReps:
      return NumberPicker(
        value: ref.watch(exerciseProvider).reps,
        minValue: 1,
        maxValue: 20,
        onChanged: onChanged,
      );
    
    
    default:
      return const Text('Picker not found');
  }
}
