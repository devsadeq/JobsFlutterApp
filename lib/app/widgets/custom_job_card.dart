import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/values/strings.dart';
import 'custom_tag.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomJobCard extends StatelessWidget {
  const CustomJobCard({
    Key? key,
    this.isFeatured = false,
    required this.avatar,
    required this.companyName,
    required this.publishTime,
    required this.jobPosition,
    required this.workplace,
    required this.employmentType,
    required this.location,
  }) : super(key: key);
  final bool isFeatured;
  final String avatar;
  final String companyName;
  final String publishTime;
  final String jobPosition;
  final String workplace;
  final String employmentType;
  final String location;

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
                  Get.theme.colorScheme.primary,
                  const Color(0xff36ABF2),
                ],
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardTile(
              isFeatured: isFeatured,
              avatar: avatar,
              companyName: companyName,
              publishTime: publishTime),
          SizedBox(height: 10.h),
          _CardJobPosition(
            isFeatured: isFeatured,
            jobPosition: jobPosition,
          ),
          if (!isFeatured) SizedBox(height: 5.h),
          if (!isFeatured) const _CardJobDescription(),
          SizedBox(height: 10.h),
          _CardTags(
            isFeatured: isFeatured,
            employmentType: employmentType,
            location: location,
            workplace: workplace,
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
    required this.avatar,
    required this.companyName,
    required this.publishTime,
  }) : super(key: key);
  final bool isFeatured;
  final String avatar;
  final String companyName;
  final String publishTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CachedNetworkImage(
            imageUrl: avatar,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 46.h,
          ),
          // child: Image.network(
          //   avatar,
          //   height: 46.w,
          // ),
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyName,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isFeatured
                    ? Get.theme.backgroundColor
                    : Get.theme.colorScheme.onBackground,
              ),
            ),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.clock,
                  size: 15.w,
                  color: isFeatured
                      ? Get.theme.backgroundColor
                      : Get.theme.colorScheme.secondary,
                ),
                SizedBox(width: 5.w),
                Text(
                  publishTime,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: isFeatured
                        ? Get.theme.backgroundColor
                        : Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        FaIcon(
          FontAwesomeIcons.bookmark,
          color: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
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
    required this.jobPosition,
  }) : super(key: key);
  final bool isFeatured;
  final String jobPosition;

  @override
  Widget build(BuildContext context) {
    return Text(
      jobPosition,
      style: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: isFeatured
            ? Get.theme.backgroundColor
            : Get.theme.colorScheme.onBackground,
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
          color: Get.theme.colorScheme.onBackground.withOpacity(0.75)),
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
    required this.workplace,
    required this.employmentType,
    required this.location,
  }) : super(key: key);
  final bool isFeatured;
  final String workplace;
  final String employmentType;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTag(
          title: workplace,
          icon: FontAwesomeIcons.briefcase,
          backgroundColor: isFeatured
              ? Colors.white.withOpacity(0.15)
              : Get.theme.backgroundColor,
          titleColor: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
        ),
        CustomTag(
          title: employmentType,
          icon: FontAwesomeIcons.fire,
          backgroundColor: isFeatured
              ? Colors.white.withOpacity(0.15)
              : Get.theme.backgroundColor,
          titleColor: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
        ),
        CustomTag(
          title: location,
          icon: FontAwesomeIcons.locationDot,
          backgroundColor: isFeatured
              ? Colors.white.withOpacity(0.15)
              : Get.theme.backgroundColor,
          titleColor: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
        ),
      ],
    );
  }
}
