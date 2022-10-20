import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

import 'custom_save_button.dart';
import 'custom_tag.dart';

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
    this.onAvatarTap,
    this.description,
    this.onActionTap,
    this.onTap,
    required this.actionIcon,
    this.isSaved = false,
  }) : super(key: key);
  final bool isFeatured;
  final String avatar;
  final String companyName;
  final String publishTime;
  final String jobPosition;
  final String workplace;
  final String employmentType;
  final String location;
  final String? description;
  final HeroIcons actionIcon;
  final bool isSaved;
  final void Function()? onAvatarTap;
  final Future<bool?> Function(bool)? onActionTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.parse(publishTime);
    final strDate = DateFormat.yMMMMd().format(datetime);

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
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
          boxShadow: [
            BoxShadow(
              color: isFeatured
                  ? Get.theme.primaryColor.withOpacity(0.15)
                  : Colors.grey.withOpacity(0.15),
              blurRadius: isFeatured ? 10 : 20,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _CardTile(
              isFeatured: isFeatured,
              avatar: avatar,
              companyName: companyName,
              publishTime: strDate,
              onAvatarTap: onAvatarTap,
              onActionTap: onActionTap,
              actionIcon: actionIcon,
              isSaved: isSaved,
            ),
            SizedBox(height: 8.h),
            _CardJobPosition(
              isFeatured: isFeatured,
              jobPosition: jobPosition,
            ),
            if (!isFeatured) SizedBox(height: 5.h),
            if (!isFeatured) _CardJobDescription(description: description!),
            SizedBox(height: 8.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: _CardTags(
                isFeatured: isFeatured,
                employmentType: employmentType,
                location: location,
                workplace: workplace,
              ),
            )
          ],
        ),
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
    this.onAvatarTap,
    this.onActionTap,
    required this.actionIcon,
    required this.isSaved,
  }) : super(key: key);
  final bool isFeatured;
  final String avatar;
  final String companyName;
  final String publishTime;
  final void Function()? onAvatarTap;
  final Future<bool?> Function(bool)? onActionTap;
  final HeroIcons actionIcon;
  final bool isSaved;

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
                color: isFeatured
                    ? Get.theme.backgroundColor
                    : Get.theme.colorScheme.onBackground,
              ),
            ),
            Row(
              children: [
                HeroIcon(
                  HeroIcons.clock,
                  size: 16.w,
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
        CustomSaveButton(
          onTap: onActionTap,
          isLiked: isSaved,
          size: 24.w,
          color: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
        ),
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
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        jobPosition,
        style: GoogleFonts.poppins(
          // fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.onBackground,
        ),
      ),
    );
  }
}

/*
* Job Description Text
* */
class _CardJobDescription extends StatelessWidget {
  const _CardJobDescription({Key? key, required this.description})
      : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
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
          icon: HeroIcons.briefcase,
          backgroundColor: isFeatured
              ? Colors.white.withOpacity(0.15)
              : Get.theme.backgroundColor,
          titleColor: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
        ),
        CustomTag(
          title: employmentType,
          icon: HeroIcons.fire,
          backgroundColor: isFeatured
              ? Colors.white.withOpacity(0.15)
              : Get.theme.backgroundColor,
          titleColor: isFeatured
              ? Get.theme.backgroundColor
              : Get.theme.colorScheme.secondary,
        ),
        CustomTag(
          title: location,
          icon: HeroIcons.mapPin,
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
