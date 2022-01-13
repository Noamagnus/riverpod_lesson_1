import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_first_riverpod/models/workout2_model.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/selectedWorkout_provider.dart';
import 'package:my_first_riverpod/repositiries/workout2DAO.dart';
import 'package:my_first_riverpod/repositiries/workoutDAO.dart';
import 'package:my_first_riverpod/screens/action_screen.dart';
import 'package:my_first_riverpod/screens/create_wokout2_screen.dart';
import 'package:my_first_riverpod/screens/create_workout_screen.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';

class WorkoutsListWithItems extends StatefulWidget {
  WorkoutsListWithItems({Key? key}) : super(key: key);

  @override
  _WorkoutsListWithItemsState createState() => _WorkoutsListWithItemsState();
}

class _WorkoutsListWithItemsState extends State<WorkoutsListWithItems> {
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            floating: true,
            snap: true,
            title: Text('Workouts2'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
        ],
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                isFabVisible = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                isFabVisible = false;
              });
            }
            return true;
          },
          child: const WorkoutsList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isFabVisible
          ? FloatingActionButton.extended(
              label: const Text('Add Workout2'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateWorkout2Screen(),
                  ),
                );
              },
            )
          : null,
    );
  }
}

class WorkoutsList extends HookConsumerWidget {
  const WorkoutsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final workoutList = ref.watch(workout2DAOProvider).getAllWorkouts();
        return StreamBuilder(
          stream: workoutList,
          initialData: const [],
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                final List<Workout2> list = snapshot.data;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final workout = list[index];
                    return InkWell(
                      onTap: () {
                        // ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(workout);
                        // ref.read()
                      },
                      child: BorderBox(
                        child: Column(
                          children: [
                            ListTile(
                              key: Key('$index'),
                              title: Text(workout.name ?? 'No name'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.play),
                                    onPressed: () {
                                      // ref
                                      // .read(selectedWorkoutNotifierProvider.notifier)
                                      // .selectWorkoutFromList(workout);
                                      // ref.read(workoutDAOProvider).deleteWorkout(workout);
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => const ActionScreen()));
                                    },
                                  ),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.trash),
                                    onPressed: () {
                                      ref.read(workout2DAOProvider).deleteWorkout(workout);
                                    },
                                  ),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.ellipsisV),
                                    onPressed: () {
                                      // ref.read(exerciseNotifierProvider.notifier).showDetails();
                                      ref.read(workout2DAOProvider).toggleDetails(workout);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (workout.showDetails) ...[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: workout.workoutItems
                                      .map(
                                        (woroutItem) => Text(
                                            'Hanging ${woroutItem.exercise?.hangingTime} Resting ${woroutItem.exercise?.restingTime} Reps ${woroutItem.exercise?.reps}'),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text('no data');
              }
            } else {
              return const Text('ne znam bato');
            }
          },
        );
      },
    );
  }
}
