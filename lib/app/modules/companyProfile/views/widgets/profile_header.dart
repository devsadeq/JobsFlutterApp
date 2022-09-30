import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/controllers/company_profile_controller.dart';
import '../../../../core/values/strings.dart';

class ProfileHeader extends GetView<CompanyProfileController> {
  const ProfileHeader({
    Key? key,
    required this.avatar,
    required this.name,
    required this.email,
  }) : super(key: key);
  final String avatar;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 52.w,
            backgroundImage: NetworkImage(avatar),
          ),
          SizedBox(height: 10.h),
          Text(
            name,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
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
          SizedBox(height: 5.h),
          Text(
            email,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
