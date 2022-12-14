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
    return Obx(
      () => controller.rxCompany.when(
        idle: () => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (company) => SingleChildScrollView(
          child: company == null
              ? const SizedBox()
              : Column(
                  children: [
                    if (company.description != null &&
                        company.description!.isNotEmpty)
                      CustomInfoCard(
                        title: "About Company",
                        icon: HeroIcons.userCircle,
                        child: Text(
                          company.description!,
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Get.theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    CustomInfoCard(
                      title: "Website",
                      icon: HeroIcons.globeAlt,
                      child: GestureDetector(
                        onTap: () =>
                            launchUrl(Uri.parse("https://www.google.com")),
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
                    CustomInfoCard(
                      title: "Head office",
                      icon: HeroIcons.mapPin,
                      child: Text(
                        "Mountain View, California, Amerika Serikat",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Get.theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    CustomInfoCard(
                      title: "Type",
                      icon: HeroIcons.homeModern,
                      child: Text(
                        "Multinational company",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Get.theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    CustomInfoCard(
                      title: "Since",
                      icon: HeroIcons.cake,
                      child: Text(
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
    );
  }
}
