import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button_with_text.dart';
import 'login_form.dart';
import '../../widgets/welcoming_msg.dart';

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
          const WelcomingMsg(
            title: "Welcome Back",
            subTitle:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          ),
          SizedBox(height: 93.h),
          const LoginForm(),
          SizedBox(height: 77.h),
          const ButtonWithText(
            btnLabel: 'LOGIN',
            firstTextSpan: "You don't have an account yet? ",
            secondTextSpan: "Sign up",
          ),
        ],
      ),
    );
  }
}
