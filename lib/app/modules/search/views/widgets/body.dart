import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../controllers/search_controller.dart';
import 'search_items.dart';

class Body extends GetView<SearchController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          CustomTextField(
            controller: controller.searchController,
            autofocus: false,
            hintText: AppStrings.SEARCH_HINT,
            isSearchBar: true,
            maxLines: 1,
            prefixIcon: HeroIcons.magnifyingGlass,
            suffixIcon: HeroIcons.xMark,
            onChanged: (_) => controller.getSearchResult(),
            onSuffixTap: () => controller.clearSearch(),
          ),
          SizedBox(height: 20.h),
          const Expanded(child: SearchResults()),
        ],
      ),
    );
  }
}
