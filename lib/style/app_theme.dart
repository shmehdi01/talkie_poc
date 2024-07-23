import 'package:flutter/material.dart';
import 'package:talkie/style/app_color.dart';

ThemeData getDefaultTheme(BuildContext context) {
  return ThemeData.dark(
    useMaterial3: true,
  ).copyWith(

    //scaffoldBackgroundColor: kColorPrimary,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      fillColor: kCardLightColor,
      filled: true,
      labelStyle: TextStyle(
        color: kSecondaryBtnText,
      ),
      hintStyle: TextStyle(
        color: kSecondaryBtnText,
        fontSize: 13,
      ),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: kColorPrimary,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white
    ),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: kColorPrimary,
          secondary: kAccentColor,
        ),
  );
}
