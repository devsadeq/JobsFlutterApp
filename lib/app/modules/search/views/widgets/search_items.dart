import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_lottie.dart';
import '../../controllers/search_controller.dart';
import 'items_card.dart';

class SearchResults extends GetView<SearchController> {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.rxResults.when(
        idle: () => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (results) => results!.isEmpty
            ? const CustomLottie(
              title: "No matching company found.",
              asset: "assets/empty.json",
              subtitle:
                  "Please make sure your keywords are spelled correctly.",
            )
            : ListView.builder(
                itemCount: results.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 22.h),
                  child: SearchItem(
                    avatar: "${ApiRoutes.BASE_URL}${results[index].image}",
                    title: results[index].name!,
                    subtitle: "Internet company",
                    onTap: () => Get.toNamed(Routes.COMPANY_PROFILE,
                        arguments: results[index].id!),
                  ),
                ),
              ),
        failure: (e) => CustomLottie(
          asset: "assets/space.json",
          title: e!,
          onTryAgain: () {},
        ),
      ),
    );
  }
}
