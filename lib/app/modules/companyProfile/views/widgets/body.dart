import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../controllers/company_profile_controller.dart';
import 'company_tab_view.dart';
import 'company_tap_bar.dart';
import 'profile_header.dart';

class Body extends GetView<CompanyProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxCompany.when(
        idle: () => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (company) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileHeader(
                  avatar: "${ApiRoutes.BASE_URL}${company!.image!}",
                  name: company.name!,
                ),
                SizedBox(height: 10.h),
                const CompanyTabBar(),
                const CompanyTabView(),
              ],
            ),
        failure: (e) => Text(e!)));
  }
}
