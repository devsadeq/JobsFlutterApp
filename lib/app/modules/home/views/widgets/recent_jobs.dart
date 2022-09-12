import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_app/app/modules/home/views/widgets/custom_job_card.dart';

import 'section_header.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "Recent Jobs"),
        SizedBox(height: 16.h),
        const CustomJobCard(),
      ],
    );
  }
}
