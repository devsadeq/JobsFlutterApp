import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/animation_widget.dart';
import '../../controllers/saved_controller.dart';
import 'no_saving.dart';
import 'saved_jobs.dart';

class Body extends GetView<SavedController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: controller.savedJobs.when(
          idle: () => Container(),
          loading: () => const CircularProgressIndicator(),
          success: (data) {
            if (data!.isEmpty) return const NoSaving();
            return SavedJobs(jobs: data);
          },
          failure: (e) => Padding(
            padding: EdgeInsets.only(bottom: 56.h),
            child: AnimationWidget(
              asset: "assets/space.json",
              repeat: true,
              title: e!,
              onTryAgain: () {},
            ),
          ),
        ),
      ),
    );
  }
}
