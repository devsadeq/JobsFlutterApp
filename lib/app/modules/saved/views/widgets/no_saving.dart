import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/values/strings.dart';


class NoSaving extends StatelessWidget {
  const NoSaving({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 153.h, left: 80.w ),
      child: Column(
        children: [

         Text('No Saving',
            style: GoogleFonts.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700),),

          SizedBox(height: 6.h ),

          Text(AppStrings.NoSaved ,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Color(0xff657786),),
            textAlign: TextAlign.center,),

          SvgPicture.asset('assets/illustration.svg',
            height: 208.h,
            width: 220.w,),

          SizedBox(height: 80.h,),

          ElevatedButton(

            style:ElevatedButton.styleFrom(
              minimumSize: Size(211.w,47.h),),

            onPressed: () {  },
            child: Text('FIND A JOB'),
          ),
        ],
      ),
    );
  }
}
