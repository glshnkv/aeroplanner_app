import 'package:flutter/material.dart';

abstract class AppColors {
  static const black = Color(0xFF111111);
  static const white = Color(0xFFFFFFFF);

  static final white40 = Color(0x66FFFFFF);
  static final white14 = Color(0x26FFFFFF);
  static final white8 = Color(0x1AFFFFFF);

  static const yellow = Color(0xFFF2C94C);
  static final yellow14 = Color(0x26F2C94C);

  static const gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x33F2C94C),
      Color(0xFF000000),
    ],
  );
}