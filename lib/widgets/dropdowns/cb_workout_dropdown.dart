import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/data/models/workout_model.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';
import 'package:my_first_riverpod/widgets/dropdowns/cb_dropdown.dart';
import 'package:my_first_riverpod/widgets/helper_widgets/spacers.dart';
import 'package:my_first_riverpod/widgets/text/cd_text.dart';

import 'cd_exercise_dropdown.dart';

class CBWorkoutDropdown extends StatelessWidget {
  const CBWorkoutDropdown({required this.workout, super.key});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return CBDropdown(
      allPadding: 20,
      hasBorder: true,
      borderWidth: 1,
      borderRadius: 10,
      iconBackgroundColor: Colors.transparent,
      expandedIconBackgroundColor: Colors.transparent,
      iconColor: kColorPrimaryGrey,
      expandedIconColor: kColorPrimaryGrey,
      crossAxisAlignment: CrossAxisAlignment.start,
      title: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CBText.headline2(text: workout.name ?? 'No name for workout'),
            const VerticalSpace(5),
            const CBText.body(
              text: 'Some description',
              color: kColorTertiaryGrey,
            ),
          ],
        ),
      ),
      expandedContentChild: CBContainer(
        allPadding: 20,
        // height: workout.listOfExercises.length * 40,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: workout.listOfExercises.map((exercise) {
              return CBExerciseDropdown(exercise: exercise);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
