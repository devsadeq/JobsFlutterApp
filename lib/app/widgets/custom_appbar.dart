import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w, bottom: 8.w, top: 8.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Image.network(
            "https://api.lorem.space/image/face?w=150&h=150",
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        "Jobs Finder",
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Get.theme.primaryColor,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
