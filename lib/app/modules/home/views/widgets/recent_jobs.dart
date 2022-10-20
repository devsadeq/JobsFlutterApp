import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/widgets/custom_lottie.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../routes/app_pages.dart';
import '../../../../data/remote/api/api_routes.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../../../widgets/shimmer/recent_jobs_shimmer.dart';
import '../../../saved/controllers/saved_controller.dart';
import '../../controllers/home_controller.dart';
import '../../../../widgets/section_header.dart';

class RecentJobs extends GetView<HomeController> {
  const RecentJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "Recent Jobs"),
        SizedBox(height: 16.h),
        Obx(
          () => controller.recentJobs.when(
            idle: () => Container(),
            loading: () => const RecentJobsShimmer(),
            success: (List<JobOutDto>? jobs) => jobs!.isNotEmpty
                ? ListView.builder(
                    itemCount: jobs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CustomJobCard(
                      avatar:
                          "${ApiRoutes.BASE_URL}${jobs[index].company!.image!}",
                      companyName: jobs[index].company!.name!,
                      publishTime: jobs[index].createdAt!,
                      jobPosition: jobs[index].position,
                      workplace: jobs[index].workplace,
                      location: jobs[index].location,
                      employmentType: jobs[index].employmentType,
                      isFeatured: false,
                      actionIcon: HeroIcons.bookmark,
                      isSaved: SavedController.to.isJobSaved(jobs[index].id!),
                      description: jobs[index].description!,
                      onTap: () => Get.toNamed(
                        Routes.JOB_DETAILS,
                        arguments: jobs[index].id,
                      ),
                      onAvatarTap: () => Get.toNamed(
                        Routes.COMPANY_PROFILE,
                        arguments: jobs[index].company!.id,
                      ),
                      onActionTap: (isSaved) => controller.onSaveButtonTapped(
                          isSaved, jobs[index].id!),
                    ),
                  )
                : CustomLottie(
                    title: "No jobs with this postion.",
                    asset: "assets/empty.json",
                    assetHeight: 200.h,
                    padding: EdgeInsets.zero,
                  ),
            failure: (String? reason) => const RecentJobsShimmer(),
          ),
        )
      ],
    );
  }
}
