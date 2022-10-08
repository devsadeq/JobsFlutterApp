import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class FeaturedJobShimmer extends StatelessWidget {
  const FeaturedJobShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: ShimmerWidget(
        width: double.infinity,
        height: 170.h,
      ),
    );
  }
}
