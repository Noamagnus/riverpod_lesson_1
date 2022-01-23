import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/timer_model.dart';

class TimerTextWidget extends HookConsumerWidget {
  const TimerTextWidget({Key? key,required this.timeLeft}) : super(key: key);
  final TimerModel timeLeft;
  @override
  Widget build(BuildContext context, ref) {
    return Text(
      timeLeft.timeLeft ?? 'Jebi ga',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
