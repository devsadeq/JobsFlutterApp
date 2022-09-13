

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/strings.dart';

class searchbar extends StatelessWidget {
  const searchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.h ),
      child: SizedBox(
        width: 342.w,
        height: 50.h,
        child: TextField(
          style:GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            filled: true,
            fillColor: Colors.white ,
            prefixIcon:Icon(Icons.search, color: Colors.black26, size: 24.w,),
            suffixIcon:IconButton(onPressed: () {},
              icon: Icon(Icons.clear, color: Colors.black, size: 16.w,),

            ),
            hintText: AppStrings.search,



          ),
        ),
      ),
    );
  }
}
