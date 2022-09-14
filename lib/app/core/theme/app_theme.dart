import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  // Light Theme Colors.
  static Color backgroundColor = const Color(0xffF5F8FA);
  static Color blueColor = const Color(0xff1DA1F2);
  static Color blackColor = const Color(0xff14171A);
  static Color darkGrayColor = const Color(0xff657786);
  static Color lightGrayColor1 = const Color(0xffAAB8C2);
  static Color lightGrayColor2 = const Color(0xffE1E8ED);
  static Color errorColor = const Color(0xffFB4747);
  static Color whiteColor = const Color(0xffffffff);
  static Color strokeColor = const Color(0xfff2f2f2);

  static final lightTheme = Get.theme.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: backgroundColor,
    hintColor: lightGrayColor1,
    cardColor: whiteColor,
    errorColor: errorColor,
    primaryColor: blackColor,
    textTheme: _lightTextTheme,
    colorScheme: _lightColorScheme,
    elevatedButtonTheme: _lightElevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final _lightTextTheme = Get.textTheme.copyWith(
    button: GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
    caption: GoogleFonts.poppins(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: lightGrayColor1,
    ),
  );

  static final _lightColorScheme = ColorScheme.fromSwatch().copyWith(
    secondary: blueColor,
    tertiary: darkGrayColor,
    onPrimary: lightGrayColor1,
    onPrimaryContainer: lightGrayColor2,
  );

  static final _lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: blueColor,
      elevation: 0.0,
      textStyle: _lightTextTheme.button,
      shadowColor: blueColor.withOpacity(0.5),
      onPrimary: backgroundColor,
      padding: EdgeInsets.all(16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.all(16.w),
    hintStyle: _lightTextTheme.caption,
    errorStyle: _lightTextTheme.caption?.copyWith(color: errorColor),
    fillColor: whiteColor,
    filled: true,
    errorMaxLines: 3,
    counterStyle: _lightTextTheme.caption,
    suffixIconColor: darkGrayColor,
    prefixIconColor: lightGrayColor1,
    enabledBorder: _outlineInputBorder,
    border: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    errorBorder: _outlineInputBorder.copyWith(
      borderSide: BorderSide(color: errorColor),
    ),
  );

  static final _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide: BorderSide(
      color: strokeColor,
      width: 1.0,
    ),
  );
}
