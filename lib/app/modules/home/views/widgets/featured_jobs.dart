import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../../../widgets/shimmer/featured_job_shimmer.dart';
import '../../controllers/home_controller.dart';
import 'section_header.dart';

class FeaturedJobs extends GetView<HomeController> {
  const FeaturedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.rxJobs.when(
        idle: () => Container(),
        loading: () => const FeaturedJobShimmer(),
        success: (jobs) => Column(
          children: [
            const SectionHeader(title: "Featured Jobs"),
            SizedBox(height: 16.h),
            CarouselSlider(
              items: _getItems(jobs!),
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
                dotsCount: _getItems(jobs).length,
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
        ),
        failure: (e) => const FeaturedJobShimmer(),
      ),
    );
  }

  List<Widget> _getItems(List<JobOutDto> items) {
    return items
        .map((job) => CustomJobCard(
              isFeatured: true,
              avatar: "${ApiRoutes.BASE_URL}${job.company!.image!}",
              companyName: job.company!.name!,
              publishTime: job.created!,
              jobPosition: job.position,
              workplace: job.workplace,
              employmentType: job.employmentType,
              location: job.location,
              onTap: () => Get.toNamed(Routes.JOB_DETAILS, arguments: job.id),
            ))
        .toList()
        .getRange(0, 4)
        .toList();
  }
}
