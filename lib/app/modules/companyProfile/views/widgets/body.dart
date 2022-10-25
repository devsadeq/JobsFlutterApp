import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_lottie.dart';
import '../../controllers/company_profile_controller.dart';
import 'company_profile_sliver_app_bar.dart';
import 'company_tab_view.dart';
import 'sliverPersistentHeaderDelegateImp.dart';

class Body extends GetView<CompanyProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxCompany.when(
          idle: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (company) => NestedScrollView(
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                CompanyProfileSliverAppBar(company: company!),
                SliverPersistentHeader(
                  delegate: SliverPersistentHeaderDelegateImp(
                    tabBar: TabBar(
                      controller: controller.tabController,
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelStyle: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      labelColor: Get.theme.colorScheme.onPrimary,
                      unselectedLabelColor: Get.theme.colorScheme.secondary,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Get.theme.colorScheme.primary,
                      ),
                      tabs: const [
                        Tab(text: "About us"),
                        Tab(text: "Jobs"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: const CompanyTabView(),
          ),
          failure: (e) => CustomLottie(
            asset: "assets/space.json",
            repeat: true,
            title: e!,
            onTryAgain: controller.onRetry,
          ),
        ));
  }
}
