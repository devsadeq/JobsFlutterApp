import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_job_card.dart';
import 'section_header.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "Recent Jobs"),
        SizedBox(height: 16.h),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: const CustomJobCard(),
          ),
        )
      ],
    );
  }
}
