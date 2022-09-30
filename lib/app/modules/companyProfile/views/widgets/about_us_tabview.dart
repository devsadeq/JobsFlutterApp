import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_company_card.dart';

class AboutUsTabView extends StatelessWidget {
  const AboutUsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          const CustomCompanyCard(
            title: "About us",
            icon: FontAwesomeIcons.circleUser,
            body: Text("about...."),
          ),
          SizedBox(height: 15.h),
          CustomCompanyCard(
            title: "Location",
            icon: FontAwesomeIcons.locationDot,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Iraq",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Baghdad - Street",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 15.h),
          // Container(
          //   height: 146.h,
          //   width: 343.w,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(14.r),
          //     color: Colors.white,
          //   ),
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(20.w),
          //         child: Row(
          //           children: [
          //             FaIcon(
          //               FontAwesomeIcons.briefcase,
          //               size: 24,
          //               color: Get.theme.colorScheme.primary,
          //             ),
          //             SizedBox(width: 12.w),
          //             Text(
          //               AppStrings.Location,
          //               style: GoogleFonts.poppins(
          //                 fontSize: 14.sp,
          //                 fontWeight: FontWeight.w700,
          //                 color: Get.theme.colorScheme.onBackground,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       const Divider(
          //         color: Colors.black12,
          //         thickness: 0.5,
          //         endIndent: 20,
          //         indent: 20,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(right: 275.w, top: 10.h),
          //         child: Text(
          //           AppStrings.nation,
          //           style: GoogleFonts.poppins(
          //             fontSize: 14.sp,
          //             fontWeight: FontWeight.w700,
          //             color: Get.theme.colorScheme.onBackground,
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(right: 200.w, top: 6.h),
          //         child: Text(
          //           AppStrings.theLocation,
          //           style: GoogleFonts.poppins(
          //             fontSize: 14.sp,
          //             fontWeight: FontWeight.w400,
          //             color: Get.theme.colorScheme.secondary,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
