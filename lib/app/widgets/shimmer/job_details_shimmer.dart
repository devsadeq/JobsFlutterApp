import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class JobDetailsShimmer extends StatelessWidget {
  const JobDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            width: double.infinity,
            height: 225.h,
            radius: 0,
          ),
          SizedBox(height: 20.h),
          ShimmerWidget(
            width: double.infinity,
            height: 300.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          ShimmerWidget(
            width: double.infinity,
            height: 100.h,
            margin: EdgeInsets.all(16.w),
          ),
          ShimmerWidget(
            width: 200.w,
            height: 20.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => ShimmerWidget(
                        width: 0.65.sw,
                        height: 200.h,
                        margin: EdgeInsets.only(right: 16.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
