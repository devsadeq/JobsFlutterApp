import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
    required this.width,
    required this.height,
    this.radius,
  }) : super(key: key);
  final double width;
  final double height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.theme.colorScheme.tertiary.withOpacity(0.7),
      highlightColor: Get.theme.colorScheme.background,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(radius ?? 14.r),
          color: Get.theme.colorScheme.tertiary.withOpacity(0.7),
        ),
      ),
    );
  }
}
