import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../widgets/custom_avatar.dart';

class AboutTheCompany extends StatelessWidget {
  const AboutTheCompany({Key? key, required this.job}) : super(key: key);
  final JobOutDto job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Get.theme.primaryColor.withOpacity(.25),
            blurRadius: 20.r,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroIcon(
                  HeroIcons.informationCircle,
                  color: Get.theme.colorScheme.onPrimary,
                  size: 18.w,
                ),
                SizedBox(width: 5.w),
                Text(
                  "About The Company",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Divider(
            color: Get.theme.colorScheme.background,
            thickness: 0.5,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                CustomAvatar(
                  imageUrl: "${ApiRoutes.BASE_URL}${job.company!.image}",
                  height: 40.h,
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.company!.name!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Get.theme.colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      //TODO: Ask backend boys to add this field
                      "Oil industry company",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    HeroIcon(
                      HeroIcons.calendarDays,
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                    Text(
                      //TODO: Ask backend boys to add this field
                      "Since 1975",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
