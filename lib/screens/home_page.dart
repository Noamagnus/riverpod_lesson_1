import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/StateNotifiers/providers.dart';
import 'package:my_first_riverpod/screens/first_page.dart';
import 'package:my_first_riverpod/screens/second_page.dart';
import 'package:my_first_riverpod/screens/third_page.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, ref) {
    final bottom = ref.watch(bottomNavigationBarProvider);
    final currentIndex = bottom.index;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: renderPage(currentIndex) ,
        // body: currentIndex == 0 ? FirstScreen() : SecondScreen(),
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ref.watch(bottomNavigationBarProvider.notifier).setIndex(index);
          },
          items: const [
            BottomNavigationBarItem(label: 'ScreenOne', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'ScreenTwo', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'ScreenThree', icon: Icon(Icons.countertops)),
          ],
        ));
  }
}

Widget renderPage(int index){
  switch (index) {
    case 0:
      return const SecondScreen();
    case 2:
    return const ThirdScreen();
    default:
    return const FirstScreen();
  }

}