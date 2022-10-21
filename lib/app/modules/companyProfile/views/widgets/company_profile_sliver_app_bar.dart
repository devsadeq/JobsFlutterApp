import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/dto/company/Company_out_dto.dart';
import '../../controllers/company_profile_controller.dart';
import 'header.dart';

class CompanyProfileSliverAppBar extends GetView<CompanyProfileController> {
  const CompanyProfileSliverAppBar({Key? key, required this.company})
      : super(key: key);
  final CompanyOutDto company;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 210.h,
      backgroundColor: Get.theme.primaryColor,
      pinned: true,
      leadingWidth: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      leading: Padding(
        padding: EdgeInsets.all(6.w),
        child: TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: const HeroIcon(
            HeroIcons.chevronLeft,
            color: Colors.white,
          ),
        ),
      ),
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Get.theme.backgroundColor,
      ),
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: const Text(
          "Company Profile",
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Header(company: company),
      ),
    );
  }
}
