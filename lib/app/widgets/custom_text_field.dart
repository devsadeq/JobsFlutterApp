import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool autofocus;
  final int? maxLines;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? title;
  final bool isRequired;
  final bool isPassword;
  final bool isVisible;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.maxLines,
    this.maxLength,
    this.controller,
    this.onSaved,
    this.validator,
    this.autofocus = true,
    this.textInputType,
    this.onFieldSubmitted,
    this.title,
    this.isRequired = false,
    this.isPassword = false,
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title!,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff14171A),
                ),
              ),
              if (isRequired)
                TextSpan(
                  text: "*",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFB4747),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff657786),
          ),
          maxLength: maxLength,
          maxLines: isPassword ? 1 : maxLines,
          keyboardType: textInputType,
          obscureText: !isVisible,
          enableSuggestions: !isPassword,
          autocorrect: !isPassword,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.w),
            counterStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffAAB8C2),
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {},
                    icon: HeroIcon(
                      isVisible ? HeroIcons.eye : HeroIcons.eyeOff,
                      color: const Color(0xff657786),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xffF2F2F2),
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xffF2F2F2),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xffF2F2F2),
                width: 1.0,
              ),
            ),
            errorStyle: TextStyle(
              color: Get.theme.errorColor,
              fontSize: 13.sp,
            ),
            errorMaxLines: 3,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: autofocus,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
