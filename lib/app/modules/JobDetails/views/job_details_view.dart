import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../widgets/custom_appbar.dart';
import '../controllers/job_details_controller.dart';
import 'widgets/body.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const HeroIcon(HeroIcons.chevronLeft),
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
