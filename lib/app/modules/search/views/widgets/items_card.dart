import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchItem extends StatelessWidget {
  const SearchItem(
      {Key? key,
      required this.avatar,
      required this.title,
      required this.subtitle})
      : super(key: key);
  final String avatar;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35.w,
          height: 35.h,
          child: CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                subtitle,
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
