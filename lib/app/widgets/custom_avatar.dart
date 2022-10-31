import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.imageUrl,
    this.height,
    this.radius,
  }) : super(key: key);
  final String imageUrl;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height ?? 80.h,
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 10000),
        child: Container(
          height: height ?? 80.h,
          width: height ?? 80.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height ?? 80.h,
        width: height ?? 80.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height ?? 80.h,
        width: height ?? 80.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Center(
          child: HeroIcon(
            HeroIcons.exclamationCircle,
            color: Colors.grey[500],
            size: 0.5 * (height ?? 80.h),
          ),
        ),
      ),
    );
  }
}
