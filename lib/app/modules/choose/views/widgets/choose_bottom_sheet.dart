import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/strings.dart';
import 'custom_choose_button.dart';

class ChooseBottomSheetBody extends StatelessWidget {
  const ChooseBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.whatAreYouLookingFor,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Get.theme.colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 42.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomChooseButton(
              title: AppStrings.iWantAJob,
              icon: FontAwesomeIcons.briefcase,
            ),
            SizedBox(width: 15.w),
            const CustomChooseButton(
              title: AppStrings.iWantAnEmployee,
              icon: FontAwesomeIcons.user,
            ),
          ],
        )
      ],
    );
  }
}
