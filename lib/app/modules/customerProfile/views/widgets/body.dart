import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/values/strings.dart';
import '../../../../widgets/custom_info_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000.r),
            child: CachedNetworkImage(
              imageUrl: AppStrings.avatarUrl,
              height: 104.h,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  const HeroIcon(HeroIcons.exclamationCircle),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Haley Jessica",
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "UX Designer",
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Email@email.com",
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              SizedBox(width: 20.w),
              Text(
                "+964771234556",
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "About me",
            body: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.",
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "Skills",
            body: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      "Leadership",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      "Target oriented",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      "Teamwork",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      "Consistent",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      "+3 more",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
