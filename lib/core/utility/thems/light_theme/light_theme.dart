import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/core/utility/color_manager/color_manager.dart';

ThemeData  lightTheme = ThemeData.light().copyWith(

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.whiteColor),
      maximumSize: MaterialStateProperty.all<Size>(Size(1.sw, 50.h)),
      minimumSize: MaterialStateProperty.all<Size>(Size(1.sw, 50.h)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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