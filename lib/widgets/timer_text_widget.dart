import 'package:flutter/material.dart';

class TimerTextWidget extends StatelessWidget {
  const TimerTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      '00:10',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}