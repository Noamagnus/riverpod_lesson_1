import 'package:flutter/material.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/add_exercise_dialog.dart';
import 'package:my_first_riverpod/widgets/add_exercise_fixed_dialog.dart';
import 'package:my_first_riverpod/widgets/add_rest_dialog.dart';
import 'package:my_first_riverpod/widgets/information_tile.dart';

class HorizontalItemsSelector extends StatelessWidget {
  const HorizontalItemsSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: AddExerciseDialog(),
                    );
                  });
            },
            child: const DynamicInformationTile(
              content: "Exercise",
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: AddRestDialog(),
                    );
                  });
            },
            child: const DynamicInformationTile(
              content: "Rest",
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Dialog(
                      child: AddExerciseFixedDialog(),
                    );
                  });
            },
            child: const DynamicInformationTile(
              content: "ExerciseFixed",
            ),
          ),
          
          addHorizontalSpace(25),
        ],
      ),
    );
  }
}
