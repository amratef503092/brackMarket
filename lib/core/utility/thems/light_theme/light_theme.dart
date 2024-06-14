import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/core/utility/color_manager/color_manager.dart';

ThemeData  lightTheme = ThemeData.light().copyWith(

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(ColorManager.whiteColor),
      maximumSize: WidgetStateProperty.all<Size>(Size(1.sw, 50.h)),
      minimumSize: WidgetStateProperty.all<Size>(Size(1.sw, 50.h)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.whiteColor,
    elevation: 10,
    titleTextStyle: TextStyle(
      color: ColorManager.blackColor,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      
    ),
  ),
  cardTheme: const CardTheme(
    color: ColorManager.whiteColor,
    elevation: 8.0,
  ),
  textTheme:  TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.blackColor,
    ),
    bodySmall: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      color: ColorManager.blackColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w900,
      color: ColorManager.blackColor,
    ),

  ),
 inputDecorationTheme: 
  const InputDecorationTheme(
    hintStyle: TextStyle(color: ColorManager.blackColor),
    labelStyle: TextStyle(color: ColorManager.blackColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color:ColorManager.blackColor),
    ),
  ),
  
  
);