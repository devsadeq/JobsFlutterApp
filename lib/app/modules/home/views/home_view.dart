import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/remote/api/api_routes.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_avatar.dart';
import '../controllers/home_controller.dart';
import 'widgets/body.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: CustomAppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 8.w, top: 8.w),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Obx(
                () => controller.customerAvatar.when(
                  idle: () => const SizedBox(),
                  loading: () => const SizedBox(),
                  success: (data) => CustomAvatar(
                    imageUrl: "${ApiRoutes.BASE_URL}$data",
                    height: 46.h,
                  ),
                  failure: (error) => const SizedBox(),
                ),
              ),
            ),
          ),
          title: "Job Finder",
        ),
        body: const Body(),
      ),
    );
  }
}
