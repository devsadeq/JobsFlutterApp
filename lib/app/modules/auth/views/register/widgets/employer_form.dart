import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

import '../../../../../widgets/custom_text_field.dart';

class EmployerForm extends StatelessWidget {
  const EmployerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            title: AppStrings.companyName,
            hintText: AppStrings.companyNameHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: AppStrings.businessNumber,
            hintText: AppStrings.phoneNumberHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: AppStrings.businessEmail,
            hintText: AppStrings.emailHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: AppStrings.countryLabel,
            hintText: AppStrings.countryHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: AppStrings.companyAddress,
            hintText: AppStrings.companyAddressHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            hintText: AppStrings.password,
            title: AppStrings.password,
            autofocus: false,
            isPassword: true,
            suffixIcon: FontAwesomeIcons.eyeSlash,
            isRequired: true,
          ),
        ],
      ),
    );
  }
}
