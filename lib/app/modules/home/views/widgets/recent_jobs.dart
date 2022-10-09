import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../../../widgets/shimmer/recent_jobs_shimmer.dart';
import '../../controllers/home_controller.dart';
import 'section_header.dart';

class RecentJobs extends GetView<HomeController> {
  const RecentJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "Recent Jobs"),
        SizedBox(height: 16.h),
        Obx(
          () => controller.rxJobs.when(
            idle: () => Container(),
            loading: () => const RecentJobsShimmer(),
            success: (List<JobOutDto>? jobs) => ListView.builder(
              itemCount: jobs!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 16.w),
                child: CustomJobCard(
                  avatar: "${ApiRoutes.BASE_URL}${jobs[index].company!.image!}",
                  companyName: jobs[index].company!.name!,
                  publishTime: jobs[index].createdAt!,
                  jobPosition: jobs[index].position,
                  workplace: jobs[index].workplace,
                  location: jobs[index].location,
                  employmentType: jobs[index].employmentType,
                  isFeatured: false,
                  description: jobs[index].description!,
                  onTap: () => Get.toNamed(
                    Routes.JOB_DETAILS,
                    arguments: jobs[index].id,
                  ),
                  onAvatarTap: () => Get.toNamed(
                    Routes.COMPANY_PROFILE,
                    arguments: jobs[index].company!.id,
                  ),
                ),
              ),
            ),
            failure: (String? reason) => const RecentJobsShimmer(),
          ),
        )
      ],
    );
  }
}
