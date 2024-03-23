import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/ui/workouts_page/bloc/workouts_bloc.dart';
import 'package:my_first_riverpod/ui/action_page/action_screen.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';
import 'package:my_first_riverpod/widgets/dropdowns/cb_dropdown.dart';
import 'package:my_first_riverpod/widgets/dropdowns/cb_workout_dropdown.dart';
import 'package:my_first_riverpod/widgets/helper_widgets/spacers.dart';
import 'package:my_first_riverpod/widgets/text/cd_text.dart';

// class WorkoutsPage extends StatefulWidget {
//   WorkoutsPage({Key? key}) : super(key: key);
//
//   @override
//   _WorkoutsPageState createState() => _WorkoutsPageState();
// }
//
// class _WorkoutsPageState extends State<WorkoutsPage> {
//   bool isFabVisible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightGreen.shade100,
//       body: NestedScrollView(
//         floatHeaderSlivers: true,
//         headerSliverBuilder: (context, innerBoxIsScrolled) => [
//           const SliverAppBar(
//             titleTextStyle: TextStyle(color: kColorGrey),
//             // textTheme: ,
//             floating: true,
//             snap: true,
//             title: Text('Workouts'),
//             centerTitle: true,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//           )
//         ],
//         body: NotificationListener<UserScrollNotification>(
//           onNotification: (notification) {
//             if (notification.direction == ScrollDirection.forward) {
//               setState(() {
//                 isFabVisible = true;
//               });
//             } else if (notification.direction == ScrollDirection.reverse) {
//               setState(() {
//                 isFabVisible = false;
//               });
//             }
//             return true;
//           },
//           child: const WorkoutsList(),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: isFabVisible
//           ? FloatingActionButton.extended(
//               label: const Text('Add Workout'),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const CreateWorkoutScreen(),
//                   ),
//                 );
//               },
//             )
//           : null,
//     );
//   }
// }

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutsBloc, WorkoutsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.workouts.length,
          itemBuilder: (BuildContext context, int index) {
            final workout = state.workouts[index];
            return CBWorkoutDropdown(workout: workout);
            // return InkWell(
            //   onTap: () {
            //     // ref.read(exerciseNotifierProvider.notifier).selectExerciseFromList(workout);
            //     // ref.read()
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //       vertical: 4,
            //       horizontal: 8,
            //     ),
            //     child: BorderBox(
            //       child: Column(
            //         children: [
            //           ListTile(
            //             key: Key('$index'),
            //             title: Text(workout.name ?? 'No name'),
            //             trailing: Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 IconButton(
            //                   icon: const FaIcon(FontAwesomeIcons.play),
            //                   onPressed: () {
            //                     // ref.read(actionWorkoutProvider.notifier).selectWorkoutFromList(workout);
            //                     // ref.read(actionWorkoutProvider.notifier).setInitialTimerDuration(workout);
            //                     // ref.read(workoutDAOProvider).deleteWorkout(workout);
            //                     Navigator.of(context)
            //                         .push(MaterialPageRoute(builder: (context) => const ActionScreen()));
            //                   },
            //                 ),
            //                 IconButton(
            //                   icon: const FaIcon(FontAwesomeIcons.trash),
            //                   onPressed: () {
            //                     // ref.read(workout2DAOProvider).deleteWorkout(workout);
            //                   },
            //                 ),
            //                 IconButton(
            //                   icon: const FaIcon(FontAwesomeIcons.ellipsisV),
            //                   onPressed: () {
            //                     // ref.read(exerciseNotifierProvider.notifier).showDetails();
            //                     // ref.read(workout2DAOProvider).toggleDetails(workout);
            //                   },
            //                 ),
            //               ],
            //             ),
            //           ),
            //           if (workout.showDetails) ...[
            //             Padding(
            //               padding: const EdgeInsets.all(16.0),
            //               child: Column(
            //                 children: workout.listOfExercises.map((exercise) {
            //                   if (exercise.exerciseType == ExerciseType.repeaters) {
            //                     return Text(
            //                         'Hanging ${exercise.hangingTime} Resting ${exercise.restingTime} Reps ${exercise
            //                             .reps}');
            //                   } else if (exercise.exerciseType == ExerciseType.fixedTime) {
            //                     return Text('Estimated time is ${exercise.estimatedTime} sec');
            //                   } else {
            //                     return Text('Rest is null');
            //                   }
            //                 }).toList(),
            //               ),
            //             ),
            //           ],
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          },
        );
      },
    );
  }
}
