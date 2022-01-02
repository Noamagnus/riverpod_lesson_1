import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/providers/providers.dart';
import 'package:my_first_riverpod/screens/create_workout_screen.dart';
import 'package:my_first_riverpod/screens/exerciselist_screen.dart';
import 'package:my_first_riverpod/screens/workoutslist_from_database.dart';
import 'package:my_first_riverpod/screens/exercise_screen.dart';
import 'package:my_first_riverpod/screens/action_screen.dart';

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
            BottomNavigationBarItem(label: 'Exercise', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Exercises', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Action', icon: Icon(Icons.countertops)),
            BottomNavigationBarItem(label: 'Workout', icon: Icon(Icons.sports)),
            BottomNavigationBarItem(label: 'Create Wrk', icon: Icon(Icons.sports)),
          ],
        ));
  }
}

Widget renderPage(int index){
  switch (index) {
    case 1:
      return const ExerciseListScreen();
    case 2:
    return const ActionScreen();
    case 3:
    return const ListFromDatabase();
    case 4:
    return const CreateWorkoutScreen();
    default:
    return const ExerciseScreen();
  }

}