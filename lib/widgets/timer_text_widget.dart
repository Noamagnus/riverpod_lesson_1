import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/providers/timer_state_notifier.dart';

class TimerTextWidget extends HookConsumerWidget {
  const TimerTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final timeLeft = ref.watch(timerProvider);
    return Text(
      timeLeft.timeLeft??'Jebi ga',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
