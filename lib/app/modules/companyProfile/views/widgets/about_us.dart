import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  title: "About Company",
                  icon: HeroIcons.userCircle,
                  body: Text(
                    company!.description!,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CustomInfoCard(
                  title: "Website",
                  icon: HeroIcons.globeAlt,
                  body: GestureDetector(
                    onTap: () => launchUrl(Uri.parse("https://www.google.com")),
                    child: Text(
                      "https://www.google.com",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CustomInfoCard(
                  title: "Head office",
                  icon: HeroIcons.mapPin,
                  body: Text(
                    "Mountain View, California, Amerika Serikat",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CustomInfoCard(
                  title: "Type",
                  icon: HeroIcons.homeModern,
                  body: Text(
                    "Multinational company",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CustomInfoCard(
                  title: "Since",
                  icon: HeroIcons.cake,
                  body: Text(
                    "1998",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Get.theme.colorScheme.secondary,
                    ),
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
