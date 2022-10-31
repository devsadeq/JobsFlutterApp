import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/widgets/custom_avatar.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);
  final String avatar;
  final String title;
  final String subtitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            CustomAvatar(
              imageUrl: avatar,
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      color: Get.theme.colorScheme.secondary.withOpacity(0.75),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
