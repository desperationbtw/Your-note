import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  const Utils();

  int randomNext(int min, int max) => min + Random().nextInt(max - min);

  //Pastel Colors
  Color noteRandomColor() => HSLColor.fromAHSL(1, randomNext(0, 360).toDouble(),
          randomNext(25, 95) / 100, randomNext(60, 70) / 100)
      .toColor();
}

class Styles {
  static TextStyle noteTitle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle noteContent = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]);
}

class Themes {
  static final day = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFd6e9ff),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF586f89)),
    textTheme: TextTheme(
        caption: TextStyle(color: Color(0xFF586f89), fontSize: 14),
        subtitle1: TextStyle(
            color: Color(0xFF444c55),
            fontWeight: FontWeight.bold,
            fontSize: 16)),
  );

  static final night = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF232d39),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1c242d)),
    textTheme: TextTheme(
        caption: TextStyle(color: Color(0xFF9aa3ad), fontSize: 14),
        subtitle1: TextStyle(
            color: Color(0xFFd6e9ff),
            fontWeight: FontWeight.bold,
            fontSize: 16)),
  );
}
