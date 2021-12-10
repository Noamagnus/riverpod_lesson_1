import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/providers.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
                children: [
                  Text(
                    car.name.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    car.speed.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    car.doors.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Slider(
                    onChanged: (value) {
                      ref.read(carProvider.notifier).doors(value);
                    },
                    value: car.doors!.toDouble(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
