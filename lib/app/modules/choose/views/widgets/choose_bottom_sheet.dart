import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/values/strings.dart';
import '../../../../domain/enums/user_type.dart';
import '../../controllers/choose_controller.dart';
import 'custom_choose_button.dart';

class ChooseBottomSheetBody extends GetView<ChooseController> {
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
            CustomChooseButton(
              title: AppStrings.iWantAJob,
              icon: HeroIcons.briefcase,
              onTap: () => controller.updateType(UserType.CUSTOMER),
            ),
            SizedBox(width: 15.w),
            CustomChooseButton(
              title: AppStrings.iWantAnEmployee,
              icon: HeroIcons.user,
              onTap: () => controller.updateType(UserType.COMPANY),
            ),
          ],
        )
      ],
    );
  }
}
