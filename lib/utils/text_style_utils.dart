import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleUtils {
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;

  static TextStyle getHeading1Bold({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? bold,
      fontSize: (fontSize ?? 36).sp,
    );
  }

  static TextStyle getBodyExtraLargeTextBold({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? bold,
      fontSize: (fontSize ?? 18).sp,
    );
  }

  static TextStyle getBodyLargeTextBold({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? bold,
      fontSize: (fontSize ?? 16).sp,
    );
  }

  static TextStyle getBodyLargeTextRegular({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? medium,
      fontSize: (fontSize ?? 18).sp,
    );
  }

  static TextStyle getBodyMediumTextBold({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? bold,
      fontSize: (fontSize ?? 14).sp,
    );
  }

  static TextStyle getBodyMediumTextRegular({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? medium,
      fontSize: (fontSize ?? 14).sp,
    );
  }

  static TextStyle getBodySmallTextBold({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? bold,
      fontSize: (fontSize ?? 12).sp,
    );
  }

  static TextStyle getBodySmallTextRegular({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? regular,
      fontSize: (fontSize ?? 12).sp,
    );
  }
}
