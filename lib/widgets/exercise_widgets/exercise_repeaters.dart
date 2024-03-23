import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';
import 'package:my_first_riverpod/widgets/dropdowns/cb_dropdown.dart';
import 'package:my_first_riverpod/widgets/helper_widgets/spacers.dart';
import 'package:my_first_riverpod/widgets/text/cd_text.dart';

class CBExerciseRepeatersDropdown extends StatelessWidget {
  const CBExerciseRepeatersDropdown({required this.exercise, super.key});

  final ExerciseRepeaters exercise;

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
            CBText.headline2(text: exercise.name ?? 'No name exercise'),
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
        child: Column (
          children: [
            CBText(text: 'Exercise name: ${exercise.uuid}'),
            CBText(text: 'Hang time: ${exercise.hangingTime}'),
            CBText(text: 'Rest time: ${exercise.restingTime}'),
            CBText(text: 'Reps: ${exercise.reps}'),
            CBText(text: 'Start after finish: ${exercise.startAfterFinish}')
          ],
        ),
      ),
    );
  }
}