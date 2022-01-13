import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/exerciseNotifierProvider.dart';
import 'package:my_first_riverpod/providers/restNotifierProvider.dart';
import 'package:numberpicker/numberpicker.dart';

class HangTimeButtonWidget extends StatelessWidget {
  final String title;
  // final int value;
  final void Function(int) onChanged;
  final void Function() onPressed;
  const HangTimeButtonWidget({
    Key? key,
    required this.title,
    // required this.value,
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
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AlertDialog(
                    content: NumberPicker(
                      value:  ref.watch(exerciseNotifierProvider).hangingTime,
                      minValue: 1,
                      maxValue: 20,
                      onChanged: onChanged,
                    ),
                    actions: [
                      TextButton(
                        onPressed: onPressed,
                        child: const Text('OK'),
                      )
                    ],
                  );
                },
              );
            });
      },
    );
  }
}

class RestTimeButtonWidget extends StatelessWidget {
  final String title;
  // final int value;
  final void Function(int) onChanged;
  final void Function() onPressed;
  const RestTimeButtonWidget({
    Key? key,
    required this.title,
    // required this.value,
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
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AlertDialog(
                    content: NumberPicker(
                      value:  ref.watch(exerciseNotifierProvider).restingTime,
                      minValue: 1,
                      maxValue: 20,
                      onChanged: onChanged,
                    ),
                    actions: [
                      TextButton(
                        onPressed: onPressed,
                        child: const Text('OK'),
                      )
                    ],
                  );
                },
              );
            });
      },
    );
  }
}

class RepsButtonWidget extends StatelessWidget {
  final String title;
  // final int value;
  final void Function(int) onChanged;
  final void Function() onPressed;
  const RepsButtonWidget({
    Key? key,
    required this.title,
    // required this.value,
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
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AlertDialog(
                    content: NumberPicker(
                      value:  ref.watch(exerciseNotifierProvider).reps,
                      minValue: 1,
                      maxValue: 20,
                      onChanged: onChanged,
                    ),
                    actions: [
                      TextButton(
                        onPressed: onPressed,
                        child: const Text('OK'),
                      )
                    ],
                  );
                },
              );
            });
      },
    );
  }
}

class RestItemButtonWidget extends StatelessWidget {
  final String title;
  // final int value;
  final void Function(int) onChanged;
  final void Function() onPressed;
  const RestItemButtonWidget({
    Key? key,
    required this.title,
    // required this.value,
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
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AlertDialog(
                    content: NumberPicker(
                      value:  ref.watch(restNotifierProvider).restTime,
                      minValue: 1,
                      maxValue: 300,
                      onChanged: onChanged,
                    ),
                    actions: [
                      TextButton(
                        onPressed: onPressed,
                        child: const Text('OK'),
                      )
                    ],
                  );
                },
              );
            });
      },
    );
  }
}
