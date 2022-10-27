import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/custom_tag.dart';

class SimilarJobCard extends StatelessWidget {
  const SimilarJobCard({
    Key? key,
    required this.avatar,
    required this.companyName,
    required this.publishTime,
    required this.jobPosition,
    required this.workplace,
    required this.employmentType,
    required this.location,
    this.onAvatarTap,
    this.onTap,
  }) : super(key: key);
  final String avatar;
  final String companyName;
  final String publishTime;
  final String jobPosition;
  final String workplace;
  final String employmentType;
  final String location;
  final void Function()? onAvatarTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.parse(publishTime);
    final strDate = DateFormat.yMMMMd().format(datetime);

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: 0.80.sw,
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _CardHeader(
              avatar: avatar,
              companyName: companyName,
              publishTime: strDate,
              onAvatarTap: onAvatarTap,
            ),
            SizedBox(height: 8.h),
            _CardJobPosition(jobPosition: jobPosition),
            SizedBox(height: 8.h),
            _CardTags(
              employmentType: employmentType,
              location: location,
              workplace: workplace,
            )
          ],
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    Key? key,
    required this.avatar,
    required this.companyName,
    required this.publishTime,
    this.onAvatarTap,
  }) : super(key: key);
  final String avatar;
  final String companyName;
  final String publishTime;
  final void Function()? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onAvatarTap ?? () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: CachedNetworkImage(
              imageUrl: avatar,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  const HeroIcon(HeroIcons.exclamationCircle),
              height: 46.h,
            ),
          ),
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
                color: Get.theme.colorScheme.onBackground,
              ),
            ),
            Row(
              children: [
                HeroIcon(
                  HeroIcons.clock,
                  size: 16.w,
                  color: Get.theme.colorScheme.secondary,
                ),
                SizedBox(width: 5.w),
                Text(
                  publishTime,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _CardJobPosition extends StatelessWidget {
  const _CardJobPosition({
    Key? key,
    required this.jobPosition,
  }) : super(key: key);
  final String jobPosition;

  @override
  Widget build(BuildContext context) {
    return Text(
      jobPosition,
      style: GoogleFonts.poppins(
        // fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: Get.theme.colorScheme.onBackground,
      ),
    );
  }
}

class _CardTags extends StatelessWidget {
  const _CardTags({
    Key? key,
    required this.workplace,
    required this.employmentType,
    required this.location,
  }) : super(key: key);
  final String workplace;
  final String employmentType;
  final String location;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          CustomTag(
            title: workplace,
            icon: HeroIcons.briefcase,
            backgroundColor: Get.theme.backgroundColor,
            titleColor: Get.theme.colorScheme.secondary,
          ),
          CustomTag(
            title: employmentType,
            icon: HeroIcons.fire,
            backgroundColor: Get.theme.backgroundColor,
            titleColor: Get.theme.colorScheme.secondary,
          ),
          CustomTag(
            title: location,
            icon: HeroIcons.mapPin,
            backgroundColor: Get.theme.backgroundColor,
            titleColor: Get.theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
