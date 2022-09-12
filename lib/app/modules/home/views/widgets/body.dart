import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_appbar.dart';

import 'featured_jobs.dart';
import 'chpis_list.dart';
import 'recent_jobs.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomAppBar(),
        SizedBox(height: 20.h),
        const ChipsList(),
        SizedBox(height: 20.h),
        const FeaturedJobs(),
        SizedBox(height: 20.h),
        const RecentJobs(),
      ],
    );
  }
}
