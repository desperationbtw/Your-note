import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_note/pages/index.dart';

import 'utils.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.day,
    darkTheme: Themes.night,
    title: "Your Note",
    home: MainPage(),
  ));
}
