import 'package:flutter/material.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/utils/fonts.dart';

class CBText extends StatelessWidget {
  const CBText({
    required this.text,
    super.key,
    this.fontFamily,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.headline1({
    required this.text,
    super.key,
    this.fontSize = 26,
    this.height = 30 / 26,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = kFontExo2Bold,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.headline2({
    required this.text,
    super.key,
    this.fontSize = 20,
    this.height = 25 / 20,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = kFontExo2Bold,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.headline3({
    required this.text,
    super.key,
    this.fontSize = 18,
    this.height = 23 / 18,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = kFontExo2Bold,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.subtitle({
    required this.text,
    super.key,
    this.fontSize = 16,
    this.height = 20 / 16,
    this.fontWeight = FontWeight.w600,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.body({
    required this.text,
    super.key,
    this.fontSize = 15,
    this.height = 20 / 15,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.bodyBold({
    required this.text,
    super.key,
    this.fontSize = 15,
    this.height = 20 / 15,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.tableHeadline({
    required this.text,
    super.key,
    this.fontSize = 14,
    this.height = 18 / 14,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.tableHeadlineBold({
    required this.text,
    super.key,
    this.fontSize = 14,
    this.height = 18 / 14,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.tableText({
    required this.text,
    super.key,
    this.fontSize = 12,
    this.height = 16 / 12,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.badge({
    required this.text,
    super.key,
    this.fontSize = 10,
    this.height = 14 / 10,
    this.fontWeight = FontWeight.w600,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryWhite,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  const CBText.expenses({
    required this.text,
    super.key,
    this.fontSize = 8,
    this.height = 16 / 8,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = kFontExo2Regular,
    this.color = kColorPrimaryGrey,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.decoration,
  });

  final String text;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        overflow: textOverflow,
        decoration: decoration,
        decorationColor: Colors.red,
      ),
    );
  }
}
