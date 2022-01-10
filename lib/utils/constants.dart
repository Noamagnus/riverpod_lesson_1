import 'package:flutter/material.dart';

const kColorBlack = Color.fromRGBO(48, 47, 48, 1.0);
const kColorGrey = Color.fromRGBO(141, 141, 141, 1.0);

const kColorWhite = Colors.white;
const kColorDarkBlue = Color.fromRGBO(20, 25, 45, 1.0);

const TextTheme kTextThemeLarge = TextTheme(
    headline1: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 30),
    headline2: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 26),
    headline3: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 24),
    headline4: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline5: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 18),
    headline6: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 16),
    bodyText1: TextStyle(
        color: kColorBlack, fontSize: 18, fontWeight: FontWeight.w500,height: 1.5),
    bodyText2: TextStyle(
        color:  kColorGrey, fontSize: 18, fontWeight: FontWeight.w500,height: 1.5),
    subtitle1:
        TextStyle(color: kColorBlack, fontSize: 16, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: kColorGrey, fontSize: 16, fontWeight: FontWeight.w400));


const TextTheme kTextThemeDefault = TextTheme(
    headline1: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 26),
    headline2: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline3: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline4: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 16),
    headline5: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline6: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: kColorBlack, fontSize: 14, fontWeight: FontWeight.w500,height: 1.5),
    bodyText2: TextStyle(
        color:  kColorGrey, fontSize: 14, fontWeight: FontWeight.w500,height: 1.5),
    subtitle1:
        TextStyle(color: kColorBlack, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: kColorGrey, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme kTextThemeSmall = TextTheme(
    headline1: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline2: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline3: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline5: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: kColorBlack, fontSize: 12, fontWeight: FontWeight.w500,height: 1.5),
    bodyText2: TextStyle(
        color:  kColorGrey, fontSize: 12, fontWeight: FontWeight.w500,height: 1.5),
    subtitle1:
    TextStyle(color: kColorBlack, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: kColorGrey, fontSize: 10, fontWeight: FontWeight.w400));
