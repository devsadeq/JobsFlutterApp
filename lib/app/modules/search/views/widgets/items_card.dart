

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/strings.dart';

class itemcard extends StatelessWidget {
  const itemcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 16),
      child:Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/google.svg',
              height: 30.h,
              width: 30.w,
              fit: BoxFit.cover,),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(AppStrings.companysName,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400 ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(AppStrings.companysField,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Color(0xffAAA6B9))

                ),

              )

            ],
          )

        ],

      ) ,

    );
  }
}
