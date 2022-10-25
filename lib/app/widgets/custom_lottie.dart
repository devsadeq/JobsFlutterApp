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
    this.description,
    this.assetHeight,
    this.padding,
    this.titleStyle,
    this.descriptionStyle,
  }) : super(key: key);
  final String title;
  final String? description;
  final String asset;
  final bool repeat;
  final void Function()? onTryAgain;
  final double? assetHeight;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

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
              style: titleStyle ??
                  GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Get.theme.colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            if (description != null) SizedBox(height: 5.w),
            if (description != null)
              Text(
                description!,
                textAlign: TextAlign.center,
                style: descriptionStyle ??
                    GoogleFonts.poppins(
                      color: Get.theme.colorScheme.tertiary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            if (onTryAgain != null)
              TextButton(
                onPressed: onTryAgain,
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
