import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import 'header.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 215.h,
      backgroundColor: Get.theme.primaryColor,
      pinned: true,
      leadingWidth: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      leading: Padding(
        padding: EdgeInsets.all(6.w),
        child: TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: const HeroIcon(
            HeroIcons.chevronLeft,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        Container(
          width: 50.w,
          height: 50.w,
          padding: EdgeInsets.all(6.w),
          child: TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: const HeroIcon(
              HeroIcons.bookmark,
              color: Colors.white,
            ),
          ),
        ),
      ],
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Get.theme.backgroundColor,
      ),
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: const Text(
          "Details",
        ),
      ),
      flexibleSpace: const FlexibleSpaceBar(
        background: Header(),
      ),
    );
  }
}
