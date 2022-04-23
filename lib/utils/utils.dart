import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkobo/utils/colors.dart';


final ThemeData base = ThemeData.light();
TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontFamily: "Montserrat",
    ),
  );
}

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary:secondaryColor),
    scaffoldBackgroundColor: whiteColor,
    backgroundColor: whiteColor,
    brightness: Brightness.light,
    fontFamily: "Axiforma",
    textTheme: _buildTextTheme(base.textTheme),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: greyColor, fontSize: 14),
      hintStyle: TextStyle(color: blackColor, fontSize: 14),
      fillColor: whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
      ),
      splashColor: greyColor,
      textTheme: ButtonTextTheme.normal,
      buttonColor: primaryColor,
    ),
  );
}
