import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCompanyCard extends StatelessWidget {
  const CustomCompanyCard({
    Key? key,
    required this.body,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final Widget body;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                icon,
                size: 24,
                color: Get.theme.colorScheme.primary,
              ),
              SizedBox(width: 10.w),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Get.theme.colorScheme.onBackground,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            color: Get.theme.colorScheme.background,
            thickness: 1.5,
          ),
          SizedBox(height: 10.h),
          body,
        ],
      ),
    );
  }
}
