import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.job}) : super(key: key);
  final JobOutDto job;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(6.w),
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Markdown(
        data: job.description!,
        // padding: EdgeInsets.zero,
        selectable: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        styleSheet: MarkdownStyleSheet(
          p: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: Get.theme.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
