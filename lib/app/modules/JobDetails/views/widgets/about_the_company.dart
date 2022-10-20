import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/custom_avatar.dart';

class AboutTheCompany extends StatelessWidget {
  const AboutTheCompany({Key? key, required this.job}) : super(key: key);
  final JobOutDto job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.COMPANY_PROFILE,
        arguments: job.company!.id,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        margin: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Get.theme.primaryColor.withOpacity(.25),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                    "About The Employer",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Divider(
              color: Get.theme.colorScheme.background,
              thickness: 0.5,
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  CustomAvatar(
                    imageUrl: "${ApiRoutes.BASE_URL}${job.company!.image}",
                    height: 40.h,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    flex: 4,
                    child: Column(
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
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(width: 5.w),

                  Column(
                    children: [
                      HeroIcon(
                        HeroIcons.calendarDays,
                        color: Get.theme.colorScheme.onPrimary,
                        // size: 20.w,
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
      ),
    );
  }
}
