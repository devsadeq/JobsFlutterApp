import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WrappedChips extends StatelessWidget {
  const WrappedChips({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        list.length,
        (index) => Padding(
          padding: EdgeInsets.all(4.w),
          child: Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: Get.theme.colorScheme.background,
            labelPadding: EdgeInsets.all(8.w),
            label: Text(
              list[index],
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
