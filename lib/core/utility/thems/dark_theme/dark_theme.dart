import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/core/utility/color_manager/color_manager.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primaryColor),
      maximumSize: MaterialStateProperty.all<Size>(Size(1.sw, 50.h)),
      minimumSize: MaterialStateProperty.all<Size>(Size(1.sw, 50.h)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  ),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
    textTheme:  TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.whiteColor,
    ),
    bodySmall: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      color: ColorManager.whiteColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w900,
      color: ColorManager.whiteColor,
    ),

  ),

  cardTheme: const CardTheme(
    color: Colors.black,
    elevation: 8.0,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
  ),

  inputDecorationTheme: 
  const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white , fontSize: 16.0),
    contentPadding: EdgeInsets.all(10.0),
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
  
);