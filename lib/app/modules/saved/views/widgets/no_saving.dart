import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../controllers/saved_controller.dart';

class NoSaving extends GetView<SavedController> {
  const NoSaving({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Saving',
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: Get.theme.colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          AppStrings.noSaved,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Get.theme.colorScheme.secondary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 23.h),
        SvgPicture.asset(
          'assets/empty_save.svg',
          height: 208.h,
        ),
        SizedBox(height: 80.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: CustomButton(
            title: "FIND A JOB",
            onTap: controller.jumpToHome,
          ),
        )
      ],
    );
  }
}
