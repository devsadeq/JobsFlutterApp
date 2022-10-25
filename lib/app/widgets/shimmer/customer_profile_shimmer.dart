import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class CustomerProfileShimmer extends StatelessWidget {
  const CustomerProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            width: double.infinity,
            height: 210.h,
            radius: 0,
            margin: EdgeInsets.only(bottom: 8.h),
          ),
          Column(
            children: List.generate(
              4,
              (index) => ShimmerWidget(
                width: double.infinity,
                height: 200.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
            ),
          )
        ],
      ),
    );
  }
}
