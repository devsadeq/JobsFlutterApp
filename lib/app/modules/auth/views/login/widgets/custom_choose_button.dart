import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class CustomChooseButton extends StatelessWidget {
  const CustomChooseButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final HeroIcons icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 95.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.w),
          backgroundColor: Colors.white,
          foregroundColor: Get.theme.colorScheme.primary,
          elevation: 0.0,
          side: BorderSide(
            color: Get.theme.colorScheme.primary,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: Get.theme.colorScheme.primary.withOpacity(0.1),
              ),
              child: Center(
                child: HeroIcon(
                  style: HeroIconStyle.solid,
                  icon,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Get.theme.colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
