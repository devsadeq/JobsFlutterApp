import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../data/remote/dto/company/Company_out_dto.dart';
import '../../../../widgets/custom_avatar.dart';
import '../../../JobDetails/controllers/job_details_controller.dart';

class Header extends GetView<JobDetailsController> {
  const Header({
    Key? key,
    required this.company,
  }) : super(key: key);
  final CompanyOutDto company;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 50.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: Svg('assets/header_bg.svg', color: Colors.white),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAvatar(
            imageUrl: "${ApiRoutes.BASE_URL}${company.image}",
          ),
          Text(
            company.name!,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
          if (company.workType != null)
            Text(
              company.workType!,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Get.theme.colorScheme.onPrimary,
              ),
            ),
        ],
      ),
    );
  }
}
