import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ["All", "Full Stack", "Web", "Mobile", "Backend"];
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 32.h,
          child: ListView.builder(
            itemCount: list.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(left: 8.w),
              child: ActionChip(
                label: Text(list[index]),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                elevation: 0.0,
                labelPadding:
                    EdgeInsets.symmetric(vertical: 1.w, horizontal: 15.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                onPressed: () {},
                backgroundColor: Get.theme.colorScheme.secondary,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Jobs",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Get.theme.primaryColor,
                ),
              ),
              Text(
                "See all",
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Get.theme.colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            height: 155.h,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.network(
                        "https://api.lorem.space/image/album?w=150&h=150",
                        height: 46.h,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Facebook Company"),
                        Text("1 day"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
