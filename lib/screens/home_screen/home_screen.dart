import 'package:flutter/material.dart';
import 'package:my_first_riverpod/screens/exercise_screen/exerciselist_screen.dart';
import 'package:my_first_riverpod/screens/workouts_screen/workouts_list_screen.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BorderBox(
                height: 250,
                child: Icon(Icons.person),
              ),
              addVerticalSpace(10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WorkoutsListWithItems(),
                  ));
                },
                child: BorderBox(
                  // padding: EdgeInsets.all(16),
                  child: Text(
                    'Workouts',
                    style: themeData.textTheme.headline1,
                  ),
                ),
              ),
           
            
              addVerticalSpace(10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const ExerciseListScreen()));
                },
                child: BorderBox(
                  // padding: EdgeInsets.all(16),
                  child: Text(
                    'Exercises',
                    style: themeData.textTheme.headline1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
