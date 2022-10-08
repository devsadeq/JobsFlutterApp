import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_app/app/widgets/shimmer/shimmer_widget.dart';

class RecentJobsShimmer extends StatelessWidget {
  const RecentJobsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 16.w),
        child: ShimmerWidget(
          width: double.infinity,
          height: 200.h,
        ),
      ),
    );
  }
}
