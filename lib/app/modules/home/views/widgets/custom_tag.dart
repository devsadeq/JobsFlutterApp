import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.icon,
    required this.title,
    required this.isFeatured,
  }) : super(key: key);
  final HeroIcons icon;
  final String title;
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: isFeatured
            ? Colors.white.withOpacity(0.15)
            : Get.theme.backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroIcon(
            icon,
            color: isFeatured
                ? Get.theme.backgroundColor
                : Get.theme.colorScheme.tertiary,
            size: 16.w,
          ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: isFeatured
                  ? Get.theme.backgroundColor
                  : Get.theme.colorScheme.tertiary,
            ),
          )
        ],
      ),
    );
  }
}
