import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 304.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 28.h, bottom: 43.h),
            width: 30.w,
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          body,
        ],
      ),
    );
  }
}
