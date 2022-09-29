import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/routes/app_pages.dart';
import 'package:jobs_flutter_app/app/widgets/custom_button.dart';

class SubmitBottomSheet extends StatelessWidget {
  const SubmitBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          FontAwesomeIcons.circleCheck,
          size: 90.w,
          color: Get.theme.primaryColor,
        ),
        SizedBox(height: 25.h),
        Text(
          "Thank You For Applying!",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Get.theme.colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "Your Application was successfully submitted.\nwe’ll contact you when a decision is made.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Get.theme.colorScheme.secondary,
          ),
        ),
        SizedBox(height: 50.h),
        CustomButton(
          title: "Back To Home",
          onTap: () => Get.offAndToNamed(Routes.ROOT),
        ),
      ],
    );
  }
}
