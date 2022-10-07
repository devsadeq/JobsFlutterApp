import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_profile_controller.dart';
import 'about_us.dart';
import 'jobs_list.dart';

class CompanyTabView extends GetView<CompanyProfileController> {
  const CompanyTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller.tabController,
        children: const [
          AboutUs(),
          JobsList(),
        ],
      ),
    );
  }
}
