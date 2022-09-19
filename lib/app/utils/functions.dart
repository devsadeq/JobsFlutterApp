import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/custom_bottom_sheet.dart';

/*
* Reusable Function that Popup a Bottom Sheet
* */
popupBottomSheet(Widget bottomSheetBody) {
  return showMaterialModalBottomSheet(
    context: Get.context!,
    builder: (context) => CustomBottomSheet(body: bottomSheetBody),
    enableDrag: false,
    isDismissible: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(22.r),
        topLeft: Radius.circular(22.r),
      ),
    ),
  );
}
