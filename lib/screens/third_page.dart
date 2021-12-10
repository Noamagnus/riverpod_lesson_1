import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/providers.dart';
import 'package:my_first_riverpod/widgets/buttons_container.dart';
import 'package:my_first_riverpod/widgets/timer_text_widget.dart';

class ThirdScreen extends ConsumerWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(carProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Car name:',
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Column(
                children: const [
                  TimerTextWidget(),
                  SizedBox(height: 20),
                  ButtonsContainer(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
