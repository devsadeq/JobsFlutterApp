import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/controllers/company_profile_controller.dart';
import 'package:jobs_flutter_app/app/utils/constants.dart';

import '../../../../widgets/custom_job_card.dart';

class JobsList extends GetView<CompanyProfileController> {
  const JobsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxJobs.when(
          idle: () => Container(),
          loading: () => const CircularProgressIndicator(),
          success: (jobs) => Column(
            children: [
              SizedBox(height: 30.h),
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 22.h),
                  child: CustomJobCard(
                    jobPosition: jobs![index].position,
                    publishTime: jobs[index].created!,
                    companyName: jobs[index].company!.name!,
                    employmentType: jobs[index].employmentType!,
                    location: jobs[index].location!,
                    workplace: jobs[index].workplace!,
                    avatar:
                        "${AppConstants.BASE_URL}${jobs[index].company!.image!}",
                    description: jobs[index].description!,
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
          failure: (e) => Text(e!),
        ));
  }
}
