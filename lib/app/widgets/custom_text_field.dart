import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool autofocus;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? title;
  final bool isRequired;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isSearchBar;
  final bool obscureText;
  final HeroIcons? suffixIcon;
  final double suffixIconSize;
  final HeroIcons? prefixIcon;
  final void Function()? onSuffixTap;
  final double prefixIconSize;
  final void Function(Country)? onCountryChanged;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.controller,
    this.onSaved,
    this.validator,
    this.autofocus = false,
    this.textInputType,
    this.onFieldSubmitted,
    this.title,
    this.isRequired = false,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isSearchBar = false,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconSize = 24,
    this.prefixIconSize = 24,
    this.onChanged,
    this.onSuffixTap,
    this.onCountryChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isSearchBar)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title ?? "",
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
        if (!isSearchBar) SizedBox(height: 8.h),
        !isPhoneNumber
            ? TextFormField(
                controller: controller,
                onChanged: onChanged,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff657786),
                ),
                maxLength: maxLength,
                maxLines: maxLines,
                minLines: minLines,
                keyboardType: textInputType,
                obscureText: obscureText,
                enableSuggestions: !isPassword,
                autocorrect: !isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding:
                      isSearchBar ? EdgeInsets.symmetric(vertical: 10.w) : null,
                  suffixIcon: suffixIcon != null
                      ? IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: onSuffixTap ?? () {},
                          icon: HeroIcon(suffixIcon!, size: suffixIconSize),
                        )
                      : null,
                  prefixIcon: prefixIcon != null
                      ? IconButton(
                          onPressed: () {},
                          icon: HeroIcon(prefixIcon!, size: prefixIconSize),
                        )
                      : null,
                ),
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: autofocus,
                onSaved: onSaved,
                onFieldSubmitted: onFieldSubmitted,
              )
            : IntlPhoneField(
                controller: controller,
                autofocus: autofocus,
                initialCountryCode: Get.deviceLocale!.countryCode.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                showDropdownIcon: true,
                flagsButtonPadding: EdgeInsets.only(left: 10.w),
                dropdownTextStyle: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                onCountryChanged: onCountryChanged,
              ),
      ],
    );
  }
}
