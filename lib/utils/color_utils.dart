import 'dart:ui';

import 'package:flutter/material.dart';

abstract class IStaticColors {
  static const Color primaryTextColor = Color(0xff000000);
  static const Color primaryColor = Color(0xffFE8019);
  static const Color buttonColor = Colors.white;
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color gray585858 = Color(0xff585858);
  static const Color grayD6D6D6 = Color(0xffD6D6D6);
  static const Color grayLightF5F5F5 = Color(0xffF5F5F5);
  static const Color grayLightEFEFEF = Color(0xffEFEFEF);

  static const Color orangeFE8019 = Color(0xffFE8019);
  static const Color yellowffc371 = Color(0xffffc371);

  static const Color redFF2B2E = Color(0xffFF2B2E);

  static const Color green057Color = Color(0xFF38C057);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xffFE8019), Color(0xffffc371)],
  );
}
