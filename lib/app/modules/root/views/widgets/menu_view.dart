import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/routes/app_pages.dart';

import '../../../../core/values/strings.dart';
import '../../../auth/controllers/auth_controller.dart';
import '../../controllers/root_controller.dart';

class MenuView extends GetView<RootController> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000.r),
                child: CachedNetworkImage(
                  imageUrl: AppStrings.avatarUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const HeroIcon(
                    HeroIcons.exclamationCircle,
                  ),
                  height: 55.h,
                ),
              ),
              IconButton(
                onPressed: controller.zoomDrawerController.close,
                icon: HeroIcon(
                  HeroIcons.xMark,
                  size: 24.w,
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            "Sadeq Al-Mhana",
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          Text(
            "@sadeq@gmail.com",
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          SizedBox(height: 50.h),
          MenuItem(
            icon: HeroIcons.user,
            title: "Profile",
            onTap: () => Get.toNamed(Routes.CUSTOMER_PROFILE),
          ),
          const MenuItem(icon: HeroIcons.bell, title: "Notifications"),
          const MenuItem(
            icon: HeroIcons.language,
            title: "Language",
            subtitle: "English",
          ),
          const MenuItem(
            icon: HeroIcons.sun,
            title: "Theme",
            subtitle: "Light",
          ),
          const Spacer(),
          MenuItem(
            icon: HeroIcons.arrowLeftOnRectangle,
            title: "Logout",
            onTap: AuthController.to.logout,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);
  final HeroIcons icon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.w),
        child: Row(
          children: [
            HeroIcon(icon),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
