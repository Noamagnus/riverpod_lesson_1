import 'package:flutter/material.dart';
import 'package:my_first_riverpod/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  const BorderBox(
      {Key? key, this.padding, this.width, this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: kColorGrey.withAlpha(40),
          width: 2,
        ),
      ),
      // If padding is null then default padding is 8
      padding: padding ?? const EdgeInsets.all(8),
      child: Center(
        child: child,
      ),
    );
  }
}