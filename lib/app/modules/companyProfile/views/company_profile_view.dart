import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/company_profile_controller.dart';
import 'widgets/body.dart';

class CompanyProfileView extends GetView<CompanyProfileController> {
  const CompanyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: const Body(),
      ),
    );
  }
}
