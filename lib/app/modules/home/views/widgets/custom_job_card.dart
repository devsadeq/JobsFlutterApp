import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../core/values/strings.dart';
import 'custom_tag.dart';

class CustomJobCard extends StatelessWidget {
  const CustomJobCard({
    Key? key,
    this.isFeatured = false,
  }) : super(key: key);
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isFeatured ? Get.theme.colorScheme.secondary : Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        gradient: isFeatured
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Get.theme.colorScheme.secondary,
                  const Color(0xff36ABF2),
                ],
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardTile(isFeatured: isFeatured),
          SizedBox(height: 10.h),
          _CardJobPosition(isFeatured: isFeatured),
          if (!isFeatured) SizedBox(height: 5.h),
          if (!isFeatured) const _CardJobDescription(),
          SizedBox(height: 10.h),
          _CardTags(
            isFeatured: isFeatured,
          )
        ],
      ),
    );
  }
}

/*
* Company name and avatar
* Published time
* Save Button
* */
class _CardTile extends StatelessWidget {
  const _CardTile({
    Key? key,
    required this.isFeatured,
  }) : super(key: key);
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Image.network(
            AppStrings.avatarUrl,
            height: 46.w,
          ),
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Facebook Company",
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isFeatured
                    ? Get.theme.backgroundColor
                    : Get.theme.primaryColor,
              ),
            ),
            Row(
              children: [
                HeroIcon(
                  HeroIcons.clock,
                  size: 15.w,
                  color: isFeatured
                      ? Get.theme.backgroundColor
                      : Get.theme.colorScheme.tertiary,
                ),
                SizedBox(width: 5.w),
                Text(
                  "1 day",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: isFeatured
                        ? Get.theme.backgroundColor
                        : Get.theme.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        HeroIcon(
          HeroIcons.bookmark,
          size: 24.w,
          color: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.tertiary,
        )
      ],
    );
  }
}

/*
* Job Position Text
* */
class _CardJobPosition extends StatelessWidget {
  const _CardJobPosition({
    Key? key,
    required this.isFeatured,
  }) : super(key: key);
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Full-Stack Developer",
      style: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: isFeatured ? Get.theme.backgroundColor : Get.theme.primaryColor,
      ),
    );
  }
}

/*
* Job Description Text
* */
class _CardJobDescription extends StatelessWidget {
  const _CardJobDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.jobDescription,
      style: GoogleFonts.poppins(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: Get.theme.primaryColor.withOpacity(0.75)),
    );
  }
}

/*
* Job tags
* */
class _CardTags extends StatelessWidget {
  const _CardTags({
    Key? key,
    required this.isFeatured,
  }) : super(key: key);
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTag(
          title: "Remote",
          icon: HeroIcons.briefcase,
          isFeatured: isFeatured,
        ),
        CustomTag(
          title: "Full Time",
          icon: HeroIcons.fire,
          isFeatured: isFeatured,
        ),
        CustomTag(
          title: "Baghdad",
          icon: HeroIcons.locationMarker,
          isFeatured: isFeatured,
        ),
      ],
    );
  }
}
