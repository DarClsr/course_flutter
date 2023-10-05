import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.bodyColor,
    hintColor: AppColor.textColor,
    primaryColorLight: AppColor.buttonBackgroundColor,
    colorScheme: ColorScheme(
        primary: AppColor.bodyColor,
        secondary: Colors.black54,
        background: AppColor.bodyColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: Colors.black,
        onSurface: Colors.black,
        surface: Colors.grey,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        brightness: Brightness.light
      ),
     textTheme: TextTheme(
       displayLarge:TextStyle(
         fontSize: 40,
         fontWeight: FontWeight.bold,
         color: Colors.black
        ) ,
       displayMedium:TextStyle(
           fontSize: 18,
           color: Colors.black
       ) ,
       bodyMedium:TextStyle(
           fontSize: 14,
           color: Colors.black
       ),
     ),
       elevatedButtonTheme:ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:MaterialStatePropertyAll(Colors.black)
        )
    ) ,

    );





