import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_lottie.dart';
import '../../controllers/customer_profile_controller.dart';
import 'about_me.dart';
import 'customer_profile_sliver_app_bar.dart';
import 'education.dart';
import 'experience.dart';
import 'languages.dart';
import 'skills.dart';

class Body extends GetView<CustomerProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.profile.when(
        idle: () => const SizedBox(),
        loading: () => const Center(child: CircularProgressIndicator()),
        failure: (reason) => CustomLottie(
          asset: "assets/space.json",
          repeat: true,
          title: reason!,
          onTryAgain: controller.onRetry,
        ),
        success: (profile) => CustomScrollView(
          slivers: [
            CustomerProfileSliverAppBar(profile: profile!),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Column(
                    children: [
                      AboutMe(description: profile.description),
                      Experience(experience: profile.workExperience),
                      EducationCard(education: profile.education),
                      Skills(skills: profile.skills),
                      Languages(languages: profile.language),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
