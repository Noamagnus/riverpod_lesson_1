import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerTextWidget extends HookConsumerWidget {
  const TimerTextWidget({Key? key,required this.timeLeft}) : super(key: key);
  final int timeLeft;
  @override
  Widget build(BuildContext context, ref) {
    return Text(
      durationString(timeLeft) ?? 'Jebi ga',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
String durationString(int duration) {
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }