import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/values/strings.dart';
import 'custom_choose_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 304.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 28.h, bottom: 43.h),
            width: 30.w,
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: Get.theme.primaryColor,
            ),
          ),
          Text(
            AppStrings.whatAreYouLookingFor,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Get.theme.primaryColor,
            ),
          ),
          SizedBox(height: 42.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomChooseButton(
                title: AppStrings.iWantAJob,
                icon: HeroIcons.briefcase,
              ),
              SizedBox(width: 15.w),
              const CustomChooseButton(
                title: AppStrings.iWantAnEmployee,
                icon: HeroIcons.user,
              ),
            ],
          )
        ],
      ),
    );
  }
}
