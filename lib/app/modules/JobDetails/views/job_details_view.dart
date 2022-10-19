import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/job_details_controller.dart';
import 'widgets/body.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const Body(),
      ),
    );
  }
}
