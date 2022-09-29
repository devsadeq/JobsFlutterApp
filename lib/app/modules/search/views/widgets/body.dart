import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/search/controllers/search_controller.dart';

import 'search_items.dart';
import '../../../../widgets/custom_text_field.dart';

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
            hintText: "Search",
            isSearchBar: true,
            prefixIcon: FontAwesomeIcons.magnifyingGlass,
            suffixIcon: FontAwesomeIcons.x,
            onChanged: (_) => controller.getSearchResult(),
          ),
          SizedBox(height: 20.h),
          const SearchResults(),
        ],
      ),
    );
  }
}
