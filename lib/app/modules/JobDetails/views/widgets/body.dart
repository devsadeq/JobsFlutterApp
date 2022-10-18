import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/functions.dart';
import '../../../../widgets/custom_avatar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_lottie.dart';
import '../../../../widgets/custom_tag.dart';
import '../../../../widgets/shimmer/job_details_shimmer.dart';
import '../../controllers/job_details_controller.dart';
import 'apply_bottom_sheet.dart';

class Body extends GetView<JobDetailsController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
      child: Obx(
        () => controller.rxJob.when(
          idle: () => Container(),
          loading: () => const JobDetailsShimmer(),
          success: (job) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(
                  Routes.COMPANY_PROFILE,
                  arguments: job!.company!.id,
                ),
                child: CustomAvatar(
                  imageUrl: "${ApiRoutes.BASE_URL}${job!.company!.image}",
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                job.position,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              SizedBox(height: 10.h),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTag(
                      title: job.workplace,
                      icon: HeroIcons.briefcase,
                      backgroundColor:
                          Get.theme.colorScheme.tertiary.withOpacity(0.25),
                      titleColor: Get.theme.colorScheme.secondary,
                    ),
                    CustomTag(
                      title: job.employmentType,
                      icon: HeroIcons.fire,
                      backgroundColor:
                          Get.theme.colorScheme.tertiary.withOpacity(0.25),
                      titleColor: Get.theme.colorScheme.secondary,
                    ),
                    CustomTag(
                      title: job.location,
                      icon: HeroIcons.mapPin,
                      backgroundColor:
                          Get.theme.colorScheme.tertiary.withOpacity(0.25),
                      titleColor: Get.theme.colorScheme.secondary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.w),
              Expanded(
                child: Markdown(
                  data: job.description!,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    p: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Get.theme.colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.w),
              CustomButton(
                title: "APPLY NOW",
                onTap: () => popupBottomSheet(
                  bottomSheetBody: ApplyBottomSheetBody(job.id!),
                ),
              ),
            ],
          ),
          failure: (e) => Center(
            child: CustomLottie(
              title: e!,
              asset: "assets/space.json",
              onTryAgain: () {},
            ),
          ),
        ),
      ),
    );
  }
}
