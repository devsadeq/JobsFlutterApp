import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/values/strings.dart';
import '../../../../routes/app_pages.dart';
import '../../../auth/controllers/auth_controller.dart';
import '../../controllers/root_controller.dart';

class MenuView extends GetView<RootController> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          SizedBox(height: 20.h),
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
            onTap: controller.logout,
            textColor: Get.theme.errorColor,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _Header extends GetView<RootController> {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        image: const DecorationImage(
          image: Svg('assets/header_bg.svg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.CUSTOMER_PROFILE),
                  child: ClipRRect(
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
                ),
                IconButton(
                  onPressed: () => Scaffold.of(context).closeDrawer(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    padding: EdgeInsets.all(6.w),
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  icon: const HeroIcon(
                    HeroIcons.xMark,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              AuthController.to.currentUser!.name!.capitalize!,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: Get.theme.colorScheme.onPrimary,
              ),
            ),
            Text(
              AuthController.to.currentUser!.email!,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.onPrimary.withOpacity(.75),
              ),
            ),
          ],
        ),
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
    this.color,
    this.textColor,
  }) : super(key: key);
  final HeroIcons icon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
        backgroundColor: color ?? Colors.transparent,
      ),
      child: Row(
        children: [
          HeroIcon(
            icon,
            color: textColor ?? Get.theme.colorScheme.secondary,
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Get.theme.colorScheme.onBackground,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: textColor ??
                        Get.theme.colorScheme.secondary.withOpacity(.75),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
