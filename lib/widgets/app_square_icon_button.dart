import 'package:flutter/material.dart';
import 'package:my_first_riverpod/utils/dimensions.dart';

class AppSquareIconButton extends StatelessWidget {
  const AppSquareIconButton(
      {Key? key,
      this.size = 40,
      required this.icon,
      this.iconColor = const Color(0xFF756d54),
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconSize = 20,
      required this.onPressed,})
      : super(key: key);
  final double size;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10), // to make it circle
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
