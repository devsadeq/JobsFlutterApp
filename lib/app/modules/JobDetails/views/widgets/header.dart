import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/modules/JobDetails/controllers/job_details_controller.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../widgets/custom_tag.dart';

class Header extends GetView<JobDetailsController> {
  const Header({Key? key, required this.job}) : super(key: key);
  final JobOutDto job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 60.h),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Get.theme.backgroundColor,
            ),
            children: [
              TextSpan(text: job.position),
              TextSpan(
                text: '\nat ',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
              TextSpan(text: job.company!.name),
            ],
          )),
          SizedBox(height: 4.h),
          FittedBox(
            child: Row(
              children: [
                CustomTag(
                  title: job.workplace,
                  icon: HeroIcons.briefcase,
                  backgroundColor: Colors.white.withOpacity(0.15),
                  titleColor: Get.theme.backgroundColor,
                ),
                CustomTag(
                  title: job.employmentType,
                  icon: HeroIcons.fire,
                  backgroundColor: Colors.white.withOpacity(0.15),
                  titleColor: Get.theme.backgroundColor,
                ),
                CustomTag(
                  title: job.location,
                  icon: HeroIcons.mapPin,
                  backgroundColor: Colors.white.withOpacity(0.15),
                  titleColor: Get.theme.backgroundColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              // TODO: Tell backend boys to add this field
              "3 days left",
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Get.theme.backgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
