import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class ChipsShimmer extends StatelessWidget {
  const ChipsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.only(left: 16.w),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(right: 6.w),
        child: ShimmerWidget(
          width: 100.w,
          height: 0.0,
          boxShape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
