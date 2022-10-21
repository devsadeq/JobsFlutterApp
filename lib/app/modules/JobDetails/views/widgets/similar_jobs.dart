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
    return Column(
      children: [
        SizedBox(height: 20.h),
        const SectionHeader(title: "You may also like"),
        Obx(
          () => controller.similarJobs.when(
            idle: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  children: List.generate(
                    data!.length,
                    (index) => SimilarJobCard(
                      workplace: data[index].workplace,
                      publishTime: data[index].createdAt!,
                      location: data[index].location,
                      jobPosition: data[index].position,
                      companyName: data[index].company!.name!,
                      employmentType: data[index].employmentType,
                      avatar:
                          "${ApiRoutes.BASE_URL}${data[index].company!.image}",
                      onTap: () => Get.toNamed(
                        Routes.COMPANY_PROFILE,
                        arguments: data[index].company!.id,
                        preventDuplicates: false,
                      ),
                      onAvatarTap: () => Get.toNamed(
                        Routes.COMPANY_PROFILE,
                        arguments: data[index].company!.id,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            failure: (e) => Center(
              child: Text(e!.toString()),
            ),
          ),
        ),
      ],
    );
  }
}
