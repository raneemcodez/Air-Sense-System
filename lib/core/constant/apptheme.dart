import 'package:flutter/material.dart';
import 'package:airaystem/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "",
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColor.green,
    ),
    bodyLarge: const TextStyle(
      height: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: AppColor.black,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColor.green,
    ),
    bodyLarge: const TextStyle(
      height: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: AppColor.black,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
