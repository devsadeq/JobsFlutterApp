import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/home/controllers/home_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'featured_jobs.dart';
import 'chips_list.dart';
import 'recent_jobs.dart';

class Body extends GetView<HomeController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: Get.theme.primaryColor,
      animSpeedFactor: 1.5,
      showChildOpacityTransition: true,
      onRefresh: () => controller.onRefresh(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const ChipsList(),
            SizedBox(height: 16.h),
            const FeaturedJobs(),
            SizedBox(height: 16.h),
            const RecentJobs(),
          ],
        ),
      ),
    );
  }
}
