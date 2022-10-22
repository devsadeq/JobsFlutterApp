import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/data/remote/api/api_routes.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/customer/customer_profile_out_dto.dart';
import 'package:jobs_flutter_app/app/modules/customerProfile/controllers/customer_profile_controller.dart';
import 'package:jobs_flutter_app/app/widgets/custom_avatar.dart';

import '../../../../core/values/strings.dart';
import '../../../../widgets/custom_info_card.dart';

class Body extends GetView<CustomerProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.profile.when(
          idle: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (reason) => Center(child: Text(reason!)),
          success: (profile) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAvatar(
                    imageUrl: "${ApiRoutes.BASE_URL}${profile!.image}"),
                SizedBox(height: 10.h),
                Text(
                  profile.name!,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  profile.jobTitle!,
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
                    //TODO: Ask backend to add this field.
                    Text(
                      "email@email.com ",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      profile.phone!,
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
                    profile.description!,
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
                        padding: EdgeInsets.all(4.w),
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
          ),
        ));
  }
}
