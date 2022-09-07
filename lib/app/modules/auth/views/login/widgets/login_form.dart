import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            hintText: "example@example.com",
            title: "Email, Phone Number or username",
            autofocus: false,
            maxLines: 1,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            hintText: "Password",
            title: "Password",
            autofocus: false,
            isPassword: true,
            isVisible: false,
          ),
        ],
      ),
    );
  }
}
