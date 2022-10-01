import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';
import 'package:jobs_flutter_app/app/modules/auth/controllers/auth_controller.dart';

import '../../../../../widgets/custom_text_field.dart';

class EmployeeForm extends GetView<AuthController> {
  const EmployeeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.customerFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.customerFullNameController,
            title: AppStrings.fullName,
            hintText: AppStrings.fullNameHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.customerPhoneNumController,
            title: AppStrings.phoneNumber,
            hintText: AppStrings.phoneNumberHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.customerEmailController,
            title: AppStrings.email,
            hintText: AppStrings.emailHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.customerPasswordController,
            hintText: AppStrings.password,
            title: AppStrings.password,
            autofocus: false,
            isPassword: true,
            obscureText: true,
            isRequired: true,
            suffixIcon: FontAwesomeIcons.eyeSlash,
          ),
        ],
      ),
    );
  }
}
