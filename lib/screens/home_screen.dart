import 'package:flutter/material.dart';
import 'package:my_first_riverpod/screens/exerciselist_screen.dart';
import 'package:my_first_riverpod/screens/workouts_screen.dart';
import 'package:my_first_riverpod/screens/workouts_screen2.dart';
import 'package:my_first_riverpod/screens/workouts_screen3.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';
import 'package:my_first_riverpod/utils/constants.dart';

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
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BorderBox(
              height: 250,
              child: Icon(Icons.person),
            ),
            addVerticalSpace(10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkoutsListScreen(),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkoutsListScreen3(),
                ));
              },
              child: BorderBox(
                // padding: EdgeInsets.all(16),
                child: Text(
                  'Workouts2',
                  style: themeData.textTheme.headline1,
                ),
              ),
            ),
            addVerticalSpace(10),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ExerciseListScreen()));
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
    );
  }
}
