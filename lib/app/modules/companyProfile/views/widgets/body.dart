import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/controllers/company_profile_controller.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/views/widgets/profile_header.dart';
import 'package:jobs_flutter_app/app/utils/constants.dart';

import 'taber.dart';

class Body extends GetView<CompanyProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxCompany.when(
        idle: () => Container(),
        loading: () => const CircularProgressIndicator(),
        success: (company) => Column(
              children: [
                ProfileHeader(
                  avatar: "${AppConstants.BASE_URL}${company!.image!}",
                  name: company.name!,
                  email: company.email!,
                ),
                SizedBox(height: 10.h),
                const Taber(),
              ],
            ),
        failure: (e) => Text(e!)));
  }
}
