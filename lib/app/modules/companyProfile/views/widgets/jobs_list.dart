import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../controllers/company_profile_controller.dart';

class JobsList extends GetView<CompanyProfileController> {
  const JobsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxJobs.when(
          idle: () => Container(),
          loading: () => const CircularProgressIndicator(),
          success: (jobs) => Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: ListView.builder(
              itemCount: jobs!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 22.h),
                child: CustomJobCard(
                  jobPosition: jobs[index].position,
                  publishTime: jobs[index].createdAt!,
                  companyName: jobs[index].company!.name!,
                  employmentType: jobs[index].employmentType!,
                  location: jobs[index].location!,
                  workplace: jobs[index].workplace!,
                  avatar:
                      "${ApiRoutes.BASE_URL}${jobs[index].company!.image!}",
                  description: jobs[index].description!,
                  onTap: () => Get.toNamed(
                    Routes.JOB_DETAILS,
                    arguments: jobs[index].id,
                  ),
                ),
              ),
            ),
          ),
          failure: (e) => Text(e!),
        ));
  }
}
