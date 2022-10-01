import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/modules/JobDetails/controllers/job_details_controller.dart';
import 'package:jobs_flutter_app/app/utils/constants.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/functions.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_tag.dart';
import 'apply_bottom_sheet.dart';

class Body extends GetView<JobDetailsController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
      child: Obx(
        () => controller.rxJob.when(
          idle: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (job) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(
                  Routes.COMPANY_PROFILE,
                  arguments: job!.company!.id,
                ),
                child: SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "${AppConstants.BASE_URL}${job!.company!.image}"),
                  ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTag(
                    title: job.workplace,
                    icon: FontAwesomeIcons.briefcase,
                    backgroundColor:
                        Get.theme.colorScheme.tertiary.withOpacity(0.25),
                    titleColor: Get.theme.colorScheme.secondary,
                  ),
                  CustomTag(
                    title: job.employmentType,
                    icon: FontAwesomeIcons.fire,
                    backgroundColor:
                        Get.theme.colorScheme.tertiary.withOpacity(0.25),
                    titleColor: Get.theme.colorScheme.secondary,
                  ),
                  CustomTag(
                    title: job.location,
                    icon: FontAwesomeIcons.locationDot,
                    backgroundColor:
                        Get.theme.colorScheme.tertiary.withOpacity(0.25),
                    titleColor: Get.theme.colorScheme.secondary,
                  ),
                ],
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
              CustomButton(
                title: "APPLY NOW",
                onTap: () => popupBottomSheet(
                  bottomSheetBody: const ApplyBottomSheetBody(),
                ),
              ),
            ],
          ),
          failure: (e) => Center(
            child: Text(e!),
          ),
        ),
      ),
    );
  }
}
