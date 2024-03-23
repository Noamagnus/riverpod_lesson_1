import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/models/exercise_model.dart';
import 'package:my_first_riverpod/utils/widget_functions.dart';
import 'package:my_first_riverpod/widgets/dialogs/add_exercise_dialog.dart';
import 'package:my_first_riverpod/widgets/add_exercise_fixed_dialog.dart';
import 'package:my_first_riverpod/widgets/dialogs/add_rest_dialog.dart';
import 'package:my_first_riverpod/widgets/helper_widgets/spacers.dart';
import 'package:my_first_riverpod/widgets/information_tile.dart';

class HorizontalItemsSelector extends StatelessWidget {
  const HorizontalItemsSelector({
    super.key,
    required this.onSelected,
  });

  final Function(ExerciseTypeNew) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...ExerciseTypeNew.values.map(
            (e) {
              return InkWell(
                onTap: () {
                  onSelected(e);
                },
                child: DynamicInformationTile(
                  content: e.name,
                ),
              );
            },
          ),
          const HorizontalSpace(20),
        ],
      ),
    );
  }
}
