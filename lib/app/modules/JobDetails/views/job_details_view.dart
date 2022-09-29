import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 24.w,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
