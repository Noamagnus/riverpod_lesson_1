import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';
import 'package:my_first_riverpod/widgets/text/cd_text.dart';

class DynamicInformationTile extends StatelessWidget {
  final String content;

  const DynamicInformationTile({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return CBContainer(
      leftMargin: 20,
      allPadding: 20,
      color: kColorBlue20,
      borderRadius: 20,
      child: CBText.headline1(text: content)
    );
  }
}
