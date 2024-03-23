import 'package:flutter/material.dart';

class CBIconButton extends StatelessWidget {
  const CBIconButton({
    required this.path,
    this.onPressed,
    super.key,
    this.size,
    this.color,
    this.iconSize,
    this.iconColor,
  });

  final void Function()? onPressed;
  final double? size;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size ?? 20),
      child: Container(
        width: size ?? 24,
        height: size ?? 24,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(size != null ? size! : 20),
        ),
        child: Center(
          child: Image.asset(
            path,
            width: iconSize ?? 12,
            height: iconSize ?? 12,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}