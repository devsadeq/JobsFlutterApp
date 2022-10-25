import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_lottie.dart';
import '../../../../widgets/shimmer/recent_jobs_shimmer.dart';
import '../../controllers/saved_controller.dart';
import 'no_saving.dart';
import 'saved_jobs.dart';

class Body extends GetView<SavedController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: controller.savedJobs.when(
          idle: () => const RecentJobsShimmer(),
          loading: () => const RecentJobsShimmer(),
          success: (data) {
            if (data!.isEmpty) return const NoSaving();
            return SavedJobs(jobs: data);
          },
          failure: (e) => CustomLottie(
            asset: "assets/space.json",
            repeat: true,
            title: e!,
            onTryAgain: controller.onRetry,
          ),
        ),
      ),
    );
  }
}
