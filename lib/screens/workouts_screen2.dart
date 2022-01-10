import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_riverpod/models/workout_model.dart';
import 'package:my_first_riverpod/providers/selectedWorkout_provider.dart';
import 'package:my_first_riverpod/repositiries/workoutDAO.dart';
import 'package:my_first_riverpod/screens/action_screen.dart';
import 'package:my_first_riverpod/widgets/border_box.dart';

class WorkoutsListScreen2 extends StatefulWidget {
  WorkoutsListScreen2({Key? key}) : super(key: key);

  @override
  _WorkoutsListScreen2State createState() => _WorkoutsListScreen2State();
}

class _WorkoutsListScreen2State extends State<WorkoutsListScreen2>
    with TickerProviderStateMixin<WorkoutsListScreen2> {
  late AnimationController _hideFabAnimation;

  @override
  initState() {
    super.initState();
    _hideFabAnimation = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _hideFabAnimation.forward();
  }

  @override
  void dispose() {
    _hideFabAnimation.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            if (userScroll.metrics.maxScrollExtent != userScroll.metrics.minScrollExtent) {
              print('scrolled forvard');
              _hideFabAnimation.forward();
            }
            break;
          case ScrollDirection.reverse:
            if (userScroll.metrics.maxScrollExtent != userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.reverse();
            }
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        appBar: AppBar(title: Text('Fabulous FAB Animation')),
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final workoutList = ref.watch(workoutDAOProvider).getAllWorkouts();
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
                    final List<Workout> list = snapshot.data;

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
                                  title: Text(
                                      'Hanging ${workout.dificultyLevel} showDetails ${workout.showDetails}'),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text('')],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const FaIcon(FontAwesomeIcons.play),
                                        onPressed: () {
                                          ref
                                              .read(selectedWorkoutNotifierProvider.notifier)
                                              .selectWorkoutFromList(workout);
                                          // ref.read(workoutDAOProvider).deleteWorkout(workout);
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => const ActionScreen()));
                                        },
                                      ),
                                      IconButton(
                                        icon: const FaIcon(FontAwesomeIcons.trash),
                                        onPressed: () {
                                          ref.read(workoutDAOProvider).deleteWorkout(workout);
                                        },
                                      ),
                                      IconButton(
                                        icon: const FaIcon(FontAwesomeIcons.ellipsisV),
                                        onPressed: () {
                                          // ref.read(exerciseNotifierProvider.notifier).showDetails();
                                          ref.read(workoutDAOProvider).toggleDetails(workout);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                if (workout.showDetails) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: workout.exercises
                                          .map((exercise) => Text(
                                              'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise.reps}'))
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
        ),
        floatingActionButton: ScaleTransition(
          scale: _hideFabAnimation,
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            elevation: 8,
            onPressed: () {},
            child: Icon(Icons.code),
          ),
        ),
      ),
    );
  }
}
