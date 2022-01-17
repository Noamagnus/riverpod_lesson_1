import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/restNotifierProvider.dart';
import 'package:my_first_riverpod/providers/workoutStateNotifier.dart';
import 'package:my_first_riverpod/providers/workoutItemNotifier.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/custom_button_widget.dart';

class AddRestDialog extends ConsumerWidget {
  AddRestDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final rest = ref.watch(restNotifierProvider);
    return Column(
      children: [

        RestItemButtonWidget(
          title: 'Rest Time ${rest.restTime} sec',
          onChanged: (value) {

            ref.read(restNotifierProvider.notifier).setRestingTime(value);
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
            
            ref.read(workoutItemNotifierProvider.notifier).setRest(rest);
            final item = ref.read(workoutItemNotifierProvider.notifier).getWorkoutItem();
            ref.read(workout2NotifierProvider.notifier).addWorkoutItem(item);
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
