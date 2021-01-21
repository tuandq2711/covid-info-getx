import 'dart:ui';

import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);
  static const Color black = Color(0xFF000000);
  static const Color colorAppbar = Color(0x80000000);
  static const Color colorRed = Color(0xFFE61862);
  static const Color colorGray = Color(0xFFCCCCCC);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [
      Color(0xFF496AE1),
      Color(0xFFCE48B1),
    ],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}

class AppSize {
  static const double tsMini = 12;
  static const double tsNormal = 14;
  static const double tsLager = 16;
  static const double tsBig = 18;
  static const double tsBigger = 20;
}
