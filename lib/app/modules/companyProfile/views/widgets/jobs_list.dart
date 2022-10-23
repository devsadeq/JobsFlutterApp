import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../../../widgets/custom_lottie.dart';
import '../../../saved/controllers/saved_controller.dart';
import '../../controllers/company_profile_controller.dart';

class JobsList extends GetView<CompanyProfileController> {
  const JobsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxJobs.when(
          idle: () => Container(),
          loading: () => const CircularProgressIndicator(),
          success: (jobs) => jobs!.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.only(top: 16.h),
                  itemCount: jobs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => CustomJobCard(
                    jobPosition: jobs[index].position,
                    publishTime: jobs[index].createdAt!,
                    companyName: jobs[index].company!.name!,
                    employmentType: jobs[index].employmentType!,
                    location: jobs[index].location!,
                    workplace: jobs[index].workplace!,
                    actionIcon: HeroIcons.bookmark,
                    avatar:
                        "${ApiRoutes.BASE_URL}${jobs[index].company!.image!}",
                    description: jobs[index].description!,
                    onTap: () => Get.toNamed(
                      Routes.JOB_DETAILS,
                      arguments: jobs[index].id,
                    ),
                    isSaved: SavedController.to.isJobSaved(jobs[index].id!),
                    onActionTap: (isSaved) =>
                        controller.onSaveButtonTapped(isSaved, jobs[index].id!),
                  ),
                )
              : const CustomLottie(
                  title: "This company has not jobs yet.",
                  asset: "assets/empty.json",
                ),
          failure: (e) => Text(e!),
        ));
  }
}
