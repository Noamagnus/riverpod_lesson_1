import 'package:flutter/material.dart';


// Circular shape icon
class AppCirularIconButton extends StatelessWidget {
  const AppCirularIconButton({
    Key? key,
    this.size = 40,
    required this.icon,
    this.iconColor=const Color(0xFF756d54),
    this.backgroundColor=const Color(0xFFfcf4e4)
  }) : super(key: key);
  final double size;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size/2), // to make it circle
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
