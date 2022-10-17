import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/remote/api/api_routes.dart';
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
            CarouselSlider.builder(
              itemCount: jobs!.length,
              itemBuilder: (context, index, realIndex) => CustomJobCard(
                isFeatured: true,
                avatar: "${ApiRoutes.BASE_URL}${jobs[index].company!.image!}",
                companyName: jobs[index].company!.name!,
                publishTime: jobs[index].createdAt!,
                jobPosition: jobs[index].position,
                workplace: jobs[index].workplace,
                employmentType: jobs[index].employmentType,
                location: jobs[index].location,
                actionIcon: HeroIcons.bookmark,
                isSaved: SavedController.to.isJobSaved(jobs[index].id!),
                onTap: () =>
                    Get.toNamed(Routes.JOB_DETAILS, arguments: jobs[index].id),
                onActionTap: (isSaved) =>
                    controller.onSaveButtonTapped(isSaved, jobs[index].id!),
              ),
              options: CarouselOptions(
                height: 1.sh/5,
                // aspectRatio: 1.sw / 0.205.sh,
                // aspectRatio: 10 / 5,
                viewportFraction: 1,
                initialPage: 0,
                onPageChanged: controller.updateIndicatorValue,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => AnimatedSmoothIndicator(
                count: jobs.length,
                activeIndex: controller.indicatorIndex,
                effect: ScrollingDotsEffect(
                  activeDotColor: Get.theme.colorScheme.primary,
                  dotColor: const Color(0xffE4E5E7),
                  dotHeight: 6.w,
                  dotWidth: 6.w,
                ),
              ),
            ),
          ],
        ),
        failure: (e) => const FeaturedJobShimmer(),
      ),
    );
  }
}
