import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/remote/api/api_routes.dart';
import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../../../widgets/shimmer/featured_job_shimmer.dart';
import '../../../saved/controllers/saved_controller.dart';
import '../../controllers/home_controller.dart';
import 'section_header.dart';

class FeaturedJobs extends GetView<HomeController> {
  const FeaturedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.featuredJobs.when(
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
              () => AnimatedSmoothIndicator(
                count: _getItems(jobs).length,
                activeIndex: controller.indicatorIndex,
                effect: ScrollingDotsEffect(
                  activeDotColor: Get.theme.colorScheme.primary,
                  dotColor: const Color(0xffE4E5E7),
                  dotHeight: 9.w,
                  dotWidth: 9.w,
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
              publishTime: job.createdAt!,
              jobPosition: job.position,
              workplace: job.workplace,
              employmentType: job.employmentType,
              location: job.location,
              actionIcon: HeroIcons.bookmark,
              isSaved: SavedController.to.isJobSaved(job.id!),
              onTap: () => Get.toNamed(Routes.JOB_DETAILS, arguments: job.id),
              onActionTap: (isSaved) =>
                  controller.onSaveButtonTapped(isSaved, job.id!),
            ))
        .toList();
  }
}
