import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.textColorDark,
    primaryColorDark: AppColor.buttonBackgroundColorDark,
    colorScheme: ColorScheme(
        primary: AppColor.bodyColorDark,
        secondary: Colors.black,
        background:AppColor.bodyColorDark,
        onPrimary:AppColor.bodyColorDark,
        onSecondary: Colors.black,
        onBackground: AppColor.bodyColorDark,
        onSurface: AppColor.bodyColorDark,
        surface: Colors.grey,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        brightness: Brightness.dark
    ),
    textTheme: TextTheme(
      displayLarge:TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      displayMedium:TextStyle(
          fontSize: 18,
          color: Colors.white
      ) ,
      displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.white
  )
);





