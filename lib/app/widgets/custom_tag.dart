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
    this.isFeatured = false,
    required this.titleColor,
    required this.backgroundColor,
  }) : super(key: key);
  final HeroIcons icon;
  final String title;
  final bool isFeatured;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.w , top: 6.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroIcon(
            icon,
            color: titleColor,
            size: 15.w,
          ),
          SizedBox(width: 5.w),
          Text(
            title.capitalize!,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: titleColor,
            ),
          )
        ],
      ),
    );
  }
}
