import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipsList extends StatelessWidget {
  const ChipsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ["All", "Full Stack", "Web", "Mobile", "Backend"];
    return SizedBox(
      height: 0.1.sw,
      child: ListView.builder(
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(left: 8.w),
          child: ActionChip(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            label: Text(list[index]),
            labelStyle: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            elevation: 0.0,
            labelPadding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 15.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
            onPressed: () {},
            backgroundColor: Get.theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
