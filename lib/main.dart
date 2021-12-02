import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Riverpod'),
      ),
    );
  }
}

Future<int> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 5));
  throw Exception('Not so fast!!!');
}

//! This is cases of different providers
final futureProvider = FutureProvider<int>((ref) => fetchWeather());
final counterProvider = StateProvider<int>((ref) => 0);
final streamProvider = StreamProvider<String>(
  (ref) => Stream.periodic(
    const Duration(microseconds: 400),
    (x) => x.toString(),
  ),
);
final counterNotifierProvider =
    StateNotifierProvider<CounterNotifier, Counter>((ref) => CounterNotifier());

//! Lets try StateNotifier thing
class Counter {
  int counts;
  int doubleCounts;
  Counter({
    this.counts = 0,
    this.doubleCounts = 20,
  });

  // Counter copyWith({
  //   int? counts,
  // }) {
  //   return Counter(
  //     counts: counts ?? this.counts,
  //   );
  // }
}

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter());

  // void increment(int counter) {
  //   final newCounts = state.counts + 1;
  //   final newState = state.copyWith(counts: newCounts);
  //   state = newState;
  // }
  void increment() {
    state.counts++;
    state.doubleCounts += 20;
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final counter = ref.watch(counterProvider);
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
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              onPressed: () {
                ref.read(counterNotifierProvider.notifier).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ));
  }
}
