import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/JobDetails/controllers/job_details_controller.dart';

import '../../../../utils/functions.dart';
import '../../../../widgets/custom_button.dart';
import 'apply_bottom_sheet.dart';

class DetailsBottomNavBar extends GetView<JobDetailsController> {
  const DetailsBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14.r),
          topRight: Radius.circular(14.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Get.theme.colorScheme.secondary.withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 159,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: CustomButton(
        title: "APPLY NOW",
        onTap: () => popupBottomSheet(
          bottomSheetBody: ApplyBottomSheetBody(
            controller.job.whenOrNull(success: (job) => job!.id!)!,
          ),
        ),
      ),
    );
  }
}
