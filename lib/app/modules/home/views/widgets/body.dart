import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'featured_jobs.dart';
import 'chips_list.dart';
import 'recent_jobs.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          const ChipsList(),
          SizedBox(height: 16.h),
          // const FeaturedJobs(),
          SizedBox(height: 16.h),
          const RecentJobs(),
        ],
      ),
    );
  }
}
