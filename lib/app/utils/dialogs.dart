import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/values/strings.dart';

class Dialogs {
  static Future<bool>? warningDialog({
    required String title,
    required String description,
    required Function() btnOkOnPress,
  }) {
    AwesomeDialog(
      context: Get.overlayContext!,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkText: AppStrings.DIALOG_BTN_OK,
      btnCancelText: AppStrings.DIALOG_BTN_CANCEL,
      btnOkOnPress: btnOkOnPress,
      headerAnimationLoop: false,
    ).show();
  }

  static Future<bool>? errorDialog({
    required String title,
    required String description,
    required Function() btnOkOnPress,
  }) {
    AwesomeDialog(
      context: Get.overlayContext!,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkText: AppStrings.DIALOG_BTN_OK,
      btnCancelText: AppStrings.DIALOG_BTN_CANCEL,
      btnOkOnPress: btnOkOnPress,
      headerAnimationLoop: false,
    ).show();
  }

  static Future<bool>? infoDialog({
    required String title,
    required String description,
    String? btnOkText,
    String? btnCancelText,
    required Function() btnCancelOnPress,
    required Function() btnOkOnPress,
  }) {
    AwesomeDialog(
      context: Get.overlayContext!,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkText: btnOkText ?? AppStrings.DIALOG_BTN_OK,
      btnCancelText: btnCancelText ?? AppStrings.DIALOG_BTN_CANCEL,
      headerAnimationLoop: false,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }

  static Future<bool>? successDialog({
    required String title,
    required String description,
    required Function() btnOkOnPress,
  }) {
    AwesomeDialog(
      context: Get.overlayContext!,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkText: AppStrings.DIALOG_BTN_OK,
      btnCancelText: AppStrings.DIALOG_BTN_CANCEL,
      btnOkOnPress: btnOkOnPress,
      headerAnimationLoop: false,
    ).show();
  }

  static Future<bool>? questionDialog({
    String? title = AppStrings.DIALOG_QUESTION_TITLE,
    String? description,
    String? btnOkText = AppStrings.DIALOG_BTN_APPROVE,
    String? btnCancelText = AppStrings.DIALOG_BTN_CANCEL,
    required Function() btnCancelOnPress,
    required Function() btnOkOnPress,
  }) {
    AwesomeDialog(
      context: Get.overlayContext!,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkText: btnOkText,
      btnCancelText: btnCancelText,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
      headerAnimationLoop: false,
      dialogBorderRadius: BorderRadius.circular(16.r),
      buttonsBorderRadius: BorderRadius.circular(14.r),
      padding: EdgeInsets.only(bottom: 12.w),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Get.theme.colorScheme.onBackground,
      ),
      descTextStyle: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: Get.theme.colorScheme.secondary,
      ),
      btnOkColor: Get.theme.primaryColor,
      buttonsTextStyle: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
      ),
    ).show();
  }
}
