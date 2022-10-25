import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class CompanyProfileShimmer extends StatelessWidget {
  const CompanyProfileShimmer({Key? key}) : super(key: key);

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
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: ShimmerWidget(
              width: double.infinity,
              height: 60.h,
            ),
          ),
          Column(
            children: List.generate(
              4,
              (index) => ShimmerWidget(
                width: double.infinity,
                height: 150.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
            ),
          )
        ],
      ),
    );
  }
}
