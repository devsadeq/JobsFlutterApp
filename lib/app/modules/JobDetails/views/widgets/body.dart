import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';
import 'package:jobs_flutter_app/app/modules/JobDetails/views/widgets/apply_bottom_sheet.dart';
import 'package:jobs_flutter_app/app/utils/functions.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_tag.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.w,
            height: 100.w,
            child: const CircleAvatar(
              backgroundImage: NetworkImage(AppStrings.avatarUrl),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "UI/UX Designer",
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
                title: "Remote",
                icon: HeroIcons.briefcase,
                backgroundColor:
                    Get.theme.colorScheme.tertiary.withOpacity(0.25),
                titleColor: Get.theme.colorScheme.secondary,
              ),
              CustomTag(
                title: "Full Time",
                icon: HeroIcons.fire,
                backgroundColor:
                    Get.theme.colorScheme.tertiary.withOpacity(0.25),
                titleColor: Get.theme.colorScheme.secondary,
              ),
              CustomTag(
                title: "Baghdad",
                icon: HeroIcons.lockOpen,
                backgroundColor:
                    Get.theme.colorScheme.tertiary.withOpacity(0.25),
                titleColor: Get.theme.colorScheme.secondary,
              ),
            ],
          ),
          SizedBox(height: 10.w),
          const Expanded(
            child: Markdown(
              data: AppStrings.markdownDemo,
              selectable: true,
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
    );
  }
}
