import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_lottie.dart';
import '../../../../widgets/shimmer/job_details_shimmer.dart';
import '../../controllers/job_details_controller.dart';
import 'about_the_employer.dart';
import 'description.dart';
import 'details_sliver_app_bar.dart';
import 'similar_jobs.dart';

class Body extends GetView<JobDetailsController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.job.when(
        idle: () => Container(),
        loading: () => const JobDetailsShimmer(),
        success: (job) => CustomScrollView(
          slivers: [
            DetailsSliverAppBar(job: job!),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Description(job: job),
                  AboutTheEmployer(job: job),
                  const SimilarJobs(),
                ],
              ),
            )
          ],
        ),
        failure: (e) => Center(
          child: CustomLottie(
            title: e!,
            asset: "assets/space.json",
            onTryAgain: () {},
          ),
        ),
      ),
    );
  }
}
