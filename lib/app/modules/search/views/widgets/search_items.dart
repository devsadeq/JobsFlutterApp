import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/search/controllers/search_controller.dart';
import 'package:jobs_flutter_app/app/utils/constants.dart';

import 'items_card.dart';

class SearchResults extends GetView<SearchController> {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.rxResults.when(
        idle: () => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (results) => ListView.builder(
          itemCount: results!.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 22.h),
            child: SearchItem(
              avatar: "${AppConstants.BASE_URL}${results[index].image}",
              title: results[index].name!,
              subtitle: "Internet company",
            ),
          ),
        ),
        failure: (e) => Center(child: Text(e!)),
      ),
    );
  }
}
