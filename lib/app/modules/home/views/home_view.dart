import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_appbar.dart';
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.network(
                "https://api.lorem.space/image/face?w=150&h=150",
                fit: BoxFit.cover,
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
