import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/values/strings.dart';
import '../../controllers/company_profile_controller.dart';

class ProfileHeader extends GetView<CompanyProfileController> {
  const ProfileHeader({
    Key? key,
    required this.avatar,
    required this.name,
  }) : super(key: key);
  final String avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10000.0),
              child: CachedNetworkImage(
                imageUrl: avatar,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const HeroIcon(HeroIcons.exclamationCircle),
                height: 84.h,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: Get.theme.colorScheme.onBackground),
            ),
            SizedBox(height: 5.h),
            Text(
              AppStrings.CompanysField,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Get.theme.colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
