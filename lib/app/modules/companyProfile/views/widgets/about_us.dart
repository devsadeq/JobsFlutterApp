import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_info_card.dart';
import '../../controllers/company_profile_controller.dart';

class AboutUs extends GetView<CompanyProfileController> {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx(
        () => controller.rxCompany.when(
          idle: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (company) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                CustomInfoCard(
                  title: "About us",
                  icon: HeroIcons.userCircle,
                  body: Text(company!.description!),
                ),
                SizedBox(height: 15.h),
                CustomInfoCard(
                  title: "Location",
                  icon: HeroIcons.mapPin,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.city!,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Get.theme.colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        company.address!,
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Get.theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          failure: (e) => Center(child: Text(e!)),
        ),
      ),
    );
  }
}
