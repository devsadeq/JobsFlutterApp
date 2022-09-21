import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/widgets/custom_button.dart';
import 'package:jobs_flutter_app/app/widgets/custom_text_field.dart';

class ApplyBottomSheetBody extends StatelessWidget {
  const ApplyBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 500.h),
        Text(
          "Why Are You Applying for This Position?",
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Get.theme.colorScheme.onBackground,
          ),
        ),
        // SizedBox(height: 15.h),
        const CustomTextField(
          minLines: 3,
          maxLines: 5,
          hintText: "Describe what you're looking for in this job...",
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            HeroIcon(
              HeroIcons.checkCircle,
              color: Get.theme.primaryColor,
            ),
            SizedBox(width: 5.w),
            Text(
              "Will take the resume from your profile.",
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.primary,
              ),
            )
          ],
        ),
        SizedBox(height: 30.h),
        CustomButton(title: "SUBMIT", onTap: () {})
      ],
    );
  }
}
