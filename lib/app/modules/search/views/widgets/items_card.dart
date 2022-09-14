import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/strings.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35.w,
          height: 35.h,
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://api.lorem.space/image?w=150&h=180",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.companysName,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                AppStrings.companysField,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  color: const Color(0xffAAA6B9),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
