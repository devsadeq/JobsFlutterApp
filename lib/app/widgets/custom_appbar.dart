import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({Key? key, this.avatarUrl, required this.title})
      : super(key: key);
  final String? avatarUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Get.theme.backgroundColor,
      leadingWidth: 50.w,
      leading: TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.only(left: 16.w),
          ),
        ),
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Image.network(
            avatarUrl!,
            height: 32.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
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
