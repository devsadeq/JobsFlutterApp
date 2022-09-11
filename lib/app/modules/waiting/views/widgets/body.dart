import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/strings.dart';
import '../../../../widgets/custom_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 250.h),
          Text(
            AppStrings.thankYou,
            style: GoogleFonts.poppins(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              color: Get.theme.primaryColor,
            ),
          ),
          Text(
            AppStrings.forYourSubmission,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: Get.theme.hintColor,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            AppStrings.willGetInTouch,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Get.theme.hintColor,
            ),
          ),
          SizedBox(height: 210.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: CustomButton(
              title: AppStrings.exit,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
