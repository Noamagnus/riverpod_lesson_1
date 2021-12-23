import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/providers.dart';
import 'package:my_first_riverpod/screens/exercise_list.dart';
import 'package:my_first_riverpod/screens/list_from_database.dart';
import 'package:my_first_riverpod/screens/screen_two.dart';
import 'package:my_first_riverpod/screens/screen_one.dart';
import 'package:my_first_riverpod/screens/screen_three.dart';

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
       
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            ref.watch(bottomNavigationBarProvider.notifier).setIndex(index);
          },
          items: const [
            BottomNavigationBarItem(label: 'ScreenOne', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'ScreenTwo', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'ScreenThree', icon: Icon(Icons.countertops)),
            BottomNavigationBarItem(label: 'Exercise List', icon: Icon(Icons.sports)),
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
    case 3:
    return const ExerciseListScreen();
    default:
    return const ListFromDatabase();
  }

}