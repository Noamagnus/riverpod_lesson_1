import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_riverpod/utils/dimensions.dart';

class EasyText extends StatelessWidget {
  const EasyText(
    this.text, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        // textBaseline: TextBaseline.ideographic
      ),
    );
  }
}

class BigText extends StatelessWidget {
  BigText(
    this.text, {
    Key? key,
    this.fontSize = 0,
    this.fontWeight,
    this.color,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);
  final String text;
  double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: GoogleFonts.roboto(
        fontSize: fontSize == 0 ? Dimensions.font20 : fontSize,
        fontWeight: fontWeight ?? FontWeight.w400, 
        color: color,
        // textBaseline: TextBaseline.ideographic
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  SmallText(
    this.text, {
    Key? key,
    this.fontSize = 0,
    this.fontWeight,
    this.color,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);
  final String text;
  double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: GoogleFonts.roboto(
        fontSize: fontSize == 0 ? Dimensions.font20 : fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        // textBaseline: TextBaseline.ideographic
      ),
    );
  }
}
