import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/StateNotifiers/providers.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  //! this returns counter StateController (type StateController<int>)
                  final counter1 = ref.watch(counterProvider.state);
                  //! and this returns actual state object (type int)
                  final counter2 = ref.watch(counterProvider);

                  final asyncValue = ref.watch(futureProvider);
                  final streamValue = ref.watch(streamProvider);
                  final counterNotifier = ref.watch(counterNotifierProvider);
                  return Column(
                    children: [
                      Text(
                        counterNotifier.counts.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        counterNotifier.doubleCounts.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      asyncValue.when(loading: () {
                        return const CircularProgressIndicator();
                      }, error: (Object error, StackTrace? stackTrace) {
                        return Text(error.toString());
                      }, data: (int data) {
                        return Text(
                          data.toString(),
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }),
                      const Text('Bla,bla'),
                      streamValue.when(
                        loading: () => const CircularProgressIndicator(),
                        data: (value) => Text(value),
                        error: (e, stack) => Text('Erron $e'),
                      ),
                      //! Classic way with StreamBuilder
                      //! when using this approach use final streamValue = ref.watch(streamProvider.strem);

                      // StreamBuilder<String>(
                      //   stream: streamValue,
                      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      //     switch (snapshot.connectionState) {
                      //       case ConnectionState.waiting:
                      //         return const CircularProgressIndicator();

                      //       default:
                      //         if (snapshot.hasError) {
                      //           return Text(snapshot.error.toString());
                      //         } else {
                      //           return Text(snapshot.data);
                      //         }
                      //         ;
                      //     }
                      //   },
                      // )
                    ],
                  );
                },
              ),
            ],
          ),
        );
  }
}