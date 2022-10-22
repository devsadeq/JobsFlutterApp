import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/section_header.dart';
import '../../controllers/job_details_controller.dart';
import 'slimilar_job_card.dart';

class SimilarJobs extends GetView<JobDetailsController> {
  const SimilarJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.similarJobs.when(
        idle: () => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (jobs) => jobs == null || jobs.isEmpty
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const SectionHeader(title: "Similar Jobs"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Row(
                        children: List.generate(
                          jobs.length,
                          (index) => SimilarJobCard(
                            workplace: jobs[index].workplace,
                            publishTime: jobs[index].createdAt!,
                            location: jobs[index].location,
                            jobPosition: jobs[index].position,
                            companyName: jobs[index].company!.name!,
                            employmentType: jobs[index].employmentType,
                            avatar:
                                "${ApiRoutes.BASE_URL}${jobs[index].company!.image}",
                            onTap: () => Get.toNamed(
                              Routes.COMPANY_PROFILE,
                              arguments: jobs[index].company!.id,
                              preventDuplicates: false,
                            ),
                            onAvatarTap: () => Get.toNamed(
                              Routes.COMPANY_PROFILE,
                              arguments: jobs[index].company!.id,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        failure: (e) => Center(
          child: Text(e!),
        ),
      ),
    );
  }
}
