import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.title,
    this.isActive = false,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.w),
      child: ActionChip(
        padding: EdgeInsets.all(6.w),
        label: Text(title),
        labelStyle: GoogleFonts.poppins(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.white : Get.theme.colorScheme.secondary,
        ),
        elevation: 0.0,
        side: BorderSide(
            color: isActive
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.secondary,
            width: 1.w),
        labelPadding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 15.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        onPressed: onPressed,
        backgroundColor: isActive
            ? Get.theme.colorScheme.primary
            : Get.theme.backgroundColor,
      ),
    );
  }
}
