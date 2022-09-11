import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

import '../../../../../widgets/custom_text_field.dart';

class EmployeeForm extends StatelessWidget {
  const EmployeeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            title: AppStrings.fullName,
            hintText: AppStrings.fullNameHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: AppStrings.phoneNumber,
            hintText: AppStrings.phoneNumberHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: AppStrings.email,
            hintText: AppStrings.emailHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            hintText: AppStrings.password,
            title: AppStrings.password,
            autofocus: false,
            isPassword: true,
            isVisible: false,
            isRequired: true,
          ),
        ],
      ),
    );
  }
}
