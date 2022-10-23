import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/customer_profile_controller.dart';
import 'about_me.dart';
import 'customer_profile_sliver_app_bar.dart';
import 'languages.dart';
import 'skills.dart';

class Body extends GetView<CustomerProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.profile.when(
          idle: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (reason) => Center(child: Text(reason!)),
          success: (profile) => NestedScrollView(
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                CustomerProfileSliverAppBar(profile: profile!),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AboutMe(description: profile!.description),
                  Skills(skills: profile.skills),
                  Languages(languages: profile.language),
                ],
              ),
            ),
          ),
        ));
  }
}
