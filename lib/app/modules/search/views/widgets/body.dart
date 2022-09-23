import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'search_items.dart';
import '../../../../widgets/custom_text_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          const CustomTextField(
            hintText: "Search",
            isSearchBar: true,
            prefixIcon: FontAwesomeIcons.magnifyingGlass,
            suffixIcon: FontAwesomeIcons.x,
          ),
          SizedBox(height: 20.h),
          const SearchResults(),
        ],
      ),
    );
  }
}
