import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../utils/functions.dart';
import '../../../../widgets/custom_save_button.dart';
import '../../../saved/controllers/saved_controller.dart';
import '../../controllers/job_details_controller.dart';
import 'header.dart';

class DetailsSliverAppBar extends GetView<JobDetailsController> {
  const DetailsSliverAppBar({Key? key, required this.job}) : super(key: key);
  final JobOutDto job;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 225.h,
      backgroundColor: Get.theme.primaryColor,
      pinned: true,
      leadingWidth: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      leading: Padding(
        padding: EdgeInsets.all(6.w),
        child: IconButton(
          onPressed: () {
            Get.back();
            setDefaultStatusBar();
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          icon: const HeroIcon(
            HeroIcons.chevronLeft,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        Container(
          width: 50.w,
          height: 50.w,
          padding: EdgeInsets.all(6.w),
          child: IconButton(
            onPressed: () => Get.back(),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            icon: CustomSaveButton(
              onTap: (isSaved) =>
                  controller.onSaveButtonTapped(isSaved, job.id!),
              isLiked: SavedController.to.isJobSaved(job.id!),
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Get.theme.backgroundColor,
      ),
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: const Text(
          "Details",
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Header(job: job),
      ),
    );
  }
}
