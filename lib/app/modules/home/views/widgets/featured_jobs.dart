import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'custom_job_card.dart';
import 'section_header.dart';

class FeaturedJobs extends GetView<HomeController> {
  const FeaturedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "Featured Jobs"),
        SizedBox(height: 16.h),
        CarouselSlider(
          items: const [
            CustomJobCard(isFeatured: true),
            CustomJobCard(isFeatured: true),
            CustomJobCard(isFeatured: true),
          ],
          options: CarouselOptions(
            height: 170.h,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            onPageChanged: controller.updateIndicatorValue,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => DotsIndicator(
            dotsCount: 3,
            position: controller.indicatorIndex.toDouble(),
            decorator: DotsDecorator(
              size: Size.square(8.w),
              activeSize: Size(20.w, 8.w),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.r),
              ),
              activeColor: Get.theme.colorScheme.primary,
              color: const Color(0xffE4E5E7),
            ),
          ),
        ),
      ],
    );
  }
}
