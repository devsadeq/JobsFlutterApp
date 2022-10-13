import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  const CustomLottie({
    Key? key,
    required this.title,
    this.onTryAgain,
    required this.asset,
    this.repeat = false,
    this.subtitle,
    this.assetHeight,
    this.padding,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final String asset;
  final bool repeat;
  final void Function()? onTryAgain;
  final double? assetHeight;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.only(bottom: kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              asset,
              height: assetHeight ?? 250.h,
              fit: BoxFit.contain,
              repeat: repeat,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: Get.theme.colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (subtitle != null) SizedBox(height: 5.w),
            if (subtitle != null)
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Get.theme.colorScheme.tertiary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            SizedBox(height: 10.w),
            if (onTryAgain != null)
              GestureDetector(
                onTap: onTryAgain,
                child: Text(
                  "Try again",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
