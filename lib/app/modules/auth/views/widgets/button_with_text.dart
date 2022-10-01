import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_button.dart';

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    Key? key,
    required this.btnLabel,
    required this.firstTextSpan,
    required this.secondTextSpan,
    required this.onTap,
    required this.onTextTap,
  }) : super(key: key);
  final String btnLabel;
  final String firstTextSpan;
  final String secondTextSpan;
  final void Function() onTap;
  final void Function() onTextTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          title: btnLabel,
          onTap: onTap,
        ),
        SizedBox(height: 20.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: firstTextSpan,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff14171A),
                ),
              ),
              TextSpan(
                text: secondTextSpan,
                recognizer: TapGestureRecognizer()..onTap = onTextTap,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff1DA1F2),
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
