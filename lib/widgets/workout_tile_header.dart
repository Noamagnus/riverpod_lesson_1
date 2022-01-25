import 'package:flutter/material.dart';

class WorkoutTileHeader extends StatelessWidget {
  final String title;
  const WorkoutTileHeader({required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.lightGreen.shade400,
          borderRadius:
             const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Center(child: Text(title)),
    );
  }
}
