import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';
import 'package:jobs_flutter_app/app/modules/home/controllers/home_controller.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_job_card.dart';
import 'section_header.dart';

class RecentJobs extends GetView<HomeController> {
  const RecentJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "Recent Jobs"),
        SizedBox(height: 16.h),
        controller.rxJobs.when(
          idle: () => Container(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (List<JobOutDto>? jobs) => ListView.builder(
            itemCount: jobs!.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 16.w),
              child: CustomJobCard(
                avatar:
                    "${AppConstants.BASE_URL}${jobs[index].company!.image!}",
                companyName: jobs[index].company!.name!,
                publishTime: jobs[index].created!,
                jobPosition: jobs[index].position,
                workplace: jobs[index].workplace,
                location: jobs[index].location,
                employmentType: jobs[index].employmentType,
                isFeatured: false,
              ),
            ),
          ),
          failure: (String? reason) => Center(
            child: Text(reason!),
          ),
        )
      ],
    );
  }
}
