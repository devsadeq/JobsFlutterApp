import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/controllers/company_profile_controller.dart';

import '../../../../widgets/custom_company_card.dart';

class AboutUsTabView extends GetView<CompanyProfileController> {
  const AboutUsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx(
        () => controller.rxCompany.when(
          idle: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (company) => Column(
            children: [
              SizedBox(height: 15.h),
              CustomCompanyCard(
                title: "About us",
                icon: FontAwesomeIcons.circleUser,
                body: Text(company!.description!),
              ),
              SizedBox(height: 15.h),
              CustomCompanyCard(
                title: "Location",
                icon: FontAwesomeIcons.locationDot,
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
          failure: (e) => Center(child: Text(e!)),
        ),
      ),
    );
  }
}
