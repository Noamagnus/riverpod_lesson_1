import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';

Color? animateColors(
  Color beginColor,
  Color endColor,
  AnimationController controller,
) {
  return ColorTween(
    begin: beginColor,
    end: endColor,
  )
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0,
            1,
          ),
        ),
      )
      .value;
}

Color? animateColorDropdownIconBackground(
  Color? beginColor,
  Color? endColor,
  AnimationController controller,
) {
  return ColorTween(
    begin: beginColor ?? kColorBlue100,
    end: endColor ?? kColorLightBlue10,
  )
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0,
            1,
          ),
        ),
      )
      .value;
}
