import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/values/strings.dart';
import '../../../widgets/custom_appbar.dart';
import '../../root/controllers/drawer_controller.dart';
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
              onTap: () => MyDrawerController.to.toggleDrawer(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CachedNetworkImage(
                  imageUrl: AppStrings.avatarUrl,
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) =>
                      const HeroIcon(HeroIcons.exclamationCircle),
                  height: 46.h,
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
