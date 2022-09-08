import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/custom_text_field.dart';

class EmployerForm extends StatelessWidget {
  const EmployerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            title: "Company name",
            hintText: "Facebook co.",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: "Business number",
            hintText: "+9647712345678",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: "Business email",
            hintText: "example@company.com",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: "Country",
            hintText: "Iraq",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: "Company address",
            hintText: "Baghdad, Karada",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            hintText: "Password",
            title: "Password",
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
