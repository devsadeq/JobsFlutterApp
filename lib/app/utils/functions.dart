import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/custom_bottom_sheet.dart';

/*
* Reusable Function that Popup a Bottom Sheet
* */
popupBottomSheet({
  required Widget bottomSheetBody,
  bool? isDismissible,
  bool? enableDrag,
}) {
  return Get.bottomSheet(
    CustomBottomSheet(body: bottomSheetBody),
    enableDrag: enableDrag ?? true,
    isDismissible: isDismissible ?? true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(22.r),
        topLeft: Radius.circular(22.r),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
  );
}

void setDefaultStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffF5F8FA),
    statusBarIconBrightness: Brightness.dark,
  ));
}

