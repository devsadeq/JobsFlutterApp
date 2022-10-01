import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/controllers/company_profile_controller.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/views/widgets/about_us_tabview.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/views/widgets/jobs_list.dart';

class Taber extends GetView<CompanyProfileController> {
  const Taber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
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
        ),
        SizedBox(
          height: 400.h,
          child: TabBarView(
            controller: controller.tabController,
            children: const [
              AboutUsTabView(),
              JobsList(),
            ],
          ),
        )
      ],
    );
  }
}
