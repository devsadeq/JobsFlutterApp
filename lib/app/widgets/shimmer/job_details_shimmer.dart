import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class JobDetailsShimmer extends StatelessWidget {
  const JobDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShimmerWidget(
          width: 104.h,
          height: 104.h,
          radius: 1000.r,
        ),
        SizedBox(height: 10.h),
        ShimmerWidget(
          width: 130.w,
          height: 24.h,
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerWidget(
              width: 100.w,
              height: 32.h,
            ),
            SizedBox(width: 10.w),
            ShimmerWidget(
              width: 100.w,
              height: 32.h,
            ),
            SizedBox(width: 10.w),
            ShimmerWidget(
              width: 100.w,
              height: 32.h,
            ),
          ],
        ),
        SizedBox(height: 30.h),
        ShimmerWidget(
          width: double.infinity,
          height: 300.h,
        ),
        const Spacer(),
        ShimmerWidget(
          width: double.infinity,
          height: 50.h,
        ),
      ],
    );
  }
}
