import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../data/remote/dto/customer/customer_profile_out_dto.dart';
import '../../../../widgets/custom_avatar.dart';
import '../../../JobDetails/controllers/job_details_controller.dart';

class Header extends GetView<JobDetailsController> {
  const Header({
    Key? key,
    required this.profile,
  }) : super(key: key);
  final CustomerProfileOutDto profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 30.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: Svg('assets/header_bg.svg', color: Colors.white),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          children: [
            CustomAvatar(imageUrl: "${ApiRoutes.BASE_URL}${profile.image}"),
            SizedBox(height: 5.h),
            Text(
              profile.name!,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Get.theme.colorScheme.onPrimary,
              ),
            ),
            Text(
              profile.jobTitle!,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
