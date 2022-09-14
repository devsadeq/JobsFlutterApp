import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

import '../../../../../widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            hintText: AppStrings.emailHint,
            title: AppStrings.emailLabel,
            autofocus: false,
            maxLines: 1,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            hintText: AppStrings.password,
            title: AppStrings.password,
            autofocus: false,
            isPassword: true,
            suffixIcon: HeroIcons.eyeOff,
          ),
        ],
      ),
    );
  }
}
