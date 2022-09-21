import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/Company_Profile//views/widgets/body.dart';
import '../controllers/company_profile_controller.dart';

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
