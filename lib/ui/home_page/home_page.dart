import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_first_riverpod/data/constants/route_names.dart';
import 'package:my_first_riverpod/router/router.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              const CBContainer(
                height: 250,
                child: Icon(Icons.person),
              ),
              addVerticalSpace(10),
              GestureDetector(
                onTap: () {
                  ProviderStatefulShell.of(context).shell.goBranch(1);
                },
                child: CBContainer(
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
                  context.pushNamed(RouteNames.exerciseList);
                },
                child: CBContainer(
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
