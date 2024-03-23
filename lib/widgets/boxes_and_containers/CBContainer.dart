import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';

class CBContainer extends StatelessWidget {
  const CBContainer({
    this.width,
    this.height,
    this.color,
    this.hasBorder = false,
    super.key,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.leftMargin,
    this.rightMargin,
    this.topMargin,
    this.bottomMargin,
    this.allPadding,
    this.allMargin,
    this.gradient,
    this.child,
  });

  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final bool hasBorder;
  final double? borderWidth;
  final Color? borderColor;

  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;

  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;

  final double? allPadding;
  final double? allMargin;

  final Gradient? gradient;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: getPadding(),
      margin: getMargin(),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        border: hasBorder
            ? Border.all(
          width: borderWidth ?? 2,
          color: borderColor ?? kColorBlack,
        )
            : null,
        gradient: gradient,
      ),
      child: child,
    );
  }

  EdgeInsetsGeometry? getPadding() {
    if (allPadding != null) {
      return EdgeInsets.all(allPadding!);
    }
    if (leftPadding != null || rightPadding != null || topPadding != null || bottomPadding != null) {
      return EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0,
      );
    }
    return null;
  }

  EdgeInsetsGeometry? getMargin() {
    if (allMargin != null) {
      return EdgeInsets.all(allMargin!);
    }
    if (leftMargin != null || rightMargin != null || topMargin != null || bottomMargin != null) {
      return EdgeInsets.only(
        left: leftMargin ?? 0,
        right: rightMargin ?? 0,
        top: topMargin ?? 0,
        bottom: bottomMargin ?? 0,
      );
    }
    return null;
  }
}
