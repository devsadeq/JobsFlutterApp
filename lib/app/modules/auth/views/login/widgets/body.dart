import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_with_text.dart';
import 'login_form.dart';
import 'welcoming_msg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 118.h),
          const WelcomingMsg(),
          SizedBox(height: 93.h),
          const LoginForm(),
          SizedBox(height: 77.h),
          const ButtonWithText(),
        ],
      ),
    );
  }
}
