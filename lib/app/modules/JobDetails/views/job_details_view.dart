import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/job_details_controller.dart';
import 'widgets/body.dart';
import 'widgets/details_bottom_nav_bar.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Get.theme.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Body()),
      bottomNavigationBar: DetailsBottomNavBar(),
    );
  }
}
