import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../views/widgets/custom_bottom_sheet.dart';

class ChooseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    showChooses();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showChooses() {
    return showMaterialModalBottomSheet(
      context: Get.context!,
      builder: (context) => const CustomBottomSheet(),
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
}
