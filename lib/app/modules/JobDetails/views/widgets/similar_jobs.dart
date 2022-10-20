import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/strings.dart';
import '../../../../widgets/section_header.dart';
import 'slimilar_job_card.dart';

class SimilarJobs extends StatelessWidget {
  const SimilarJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        const SectionHeader(title: "You may also like"),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              SimilarJobCard(
                avatar: AppStrings.avatarUrl,
                companyName: 'Facebook',
                publishTime: '2021-08-01T00:00:00.000Z',
                jobPosition: 'Full Stack Developer',
                workplace: 'Remote',
                employmentType: 'Full Time',
                location: 'New York',
              ),
              SimilarJobCard(
                avatar: AppStrings.avatarUrl,
                companyName: 'Facebook',
                publishTime: '2021-08-01T00:00:00.000Z',
                jobPosition: 'Full Stack Developer',
                workplace: 'Remote',
                employmentType: 'Full Time',
                location: 'New York',
              ),
              SimilarJobCard(
                avatar: AppStrings.avatarUrl,
                companyName: 'Facebook',
                publishTime: '2021-08-01T00:00:00.000Z',
                jobPosition: 'Full Stack Developer',
                workplace: 'Remote',
                employmentType: 'Full Time',
                location: 'New York',
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        // ListView.builder(
        //   itemCount: 3,
        //   shrinkWrap: true,
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context, index) => const SimilarJobCard(
        //     avatar: AppStrings.avatarUrl,
        //     companyName: 'Facebook',
        //     publishTime: '2021-08-01T00:00:00.000Z',
        //     jobPosition: 'Full Stack Developer',
        //     workplace: 'Remote',
        //     employmentType: 'Full Time',
        //     location: 'New York',
        //   ),
        // ),
      ],
    );
  }
}
