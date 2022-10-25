import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../controllers/job_details_controller.dart';
import 'widgets/body.dart';
import 'widgets/details_bottom_nav_bar.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const Body(),
        bottomNavigationBar:
            controller.job is Success ? const DetailsBottomNavBar() : null,
      ),
    );
  }
}
