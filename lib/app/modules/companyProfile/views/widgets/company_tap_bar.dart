import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/company_profile_controller.dart';

class CompanyTabBar extends GetView<CompanyProfileController> {
  const CompanyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      labelStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ),
      labelColor: Get.theme.colorScheme.onBackground,
      unselectedLabelColor: Get.theme.colorScheme.tertiary,
      tabs: const [
        Tab(text: "About us"),
        Tab(text: "Jobs"),
      ],
    );
  }
}
