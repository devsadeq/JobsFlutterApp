import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../widgets/custom_appbar.dart';
import '../controllers/company_profile_controller.dart';
import 'widgets/body.dart';

class CompanyProfileView extends GetView<CompanyProfileController> {
  const CompanyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: HeroIcon(
              HeroIcons.chevronLeft,
              size: 24.w,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
        ),
        backgroundColor: Get.theme.backgroundColor,
        body: const Body(),
      ),
    );
  }
}
