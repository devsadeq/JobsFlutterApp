import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../controllers/saved_controller.dart';

class SavedJobs extends GetView<SavedController> {
  const SavedJobs({
    Key? key,
    required this.jobs,
  }) : super(key: key);
  final List<JobOutDto> jobs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ListView.builder(
          itemCount: jobs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 22.h),
            child: CustomJobCard(
              avatar: "${ApiRoutes.BASE_URL}${jobs[index].company!.image}",
              companyName: jobs[index].company!.name!,
              employmentType: jobs[index].employmentType,
              jobPosition: jobs[index].position,
              location: jobs[index].location,
              // publishTime: jobs[index].created!,
              publishTime: "2022-10-01T01:24:36.473Z",
              workplace: jobs[index].workplace,
              description: jobs[index].description,
            ),
          ),
        )
      ],
    );
  }
}
