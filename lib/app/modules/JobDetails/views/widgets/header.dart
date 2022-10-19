import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_tag.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Senior UX Designer \nat Shell LLC",
              style: GoogleFonts.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Get.theme.backgroundColor,
              ),
            ),
            SizedBox(height: 4.h),
            FittedBox(
              child: Row(
                children: [
                  CustomTag(
                    title: "workplace",
                    icon: HeroIcons.briefcase,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    titleColor: Get.theme.backgroundColor,
                  ),
                  CustomTag(
                    title: "employmentType",
                    icon: HeroIcons.fire,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    titleColor: Get.theme.backgroundColor,
                  ),
                  CustomTag(
                    title: "location",
                    icon: HeroIcons.mapPin,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    titleColor: Get.theme.backgroundColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "3 days left",
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Get.theme.backgroundColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
