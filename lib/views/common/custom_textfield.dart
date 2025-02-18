import 'package:flutter/material.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.borderRadius,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(10.0);

    return Container(
      color: kLightGrey,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: appstyle(14, kDarkGrey, FontWeight.w500),
          errorBorder: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
            borderSide: BorderSide(color: kDarkGrey, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
            borderSide: BorderSide(color: Colors.transparent, width: 0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
          ),
        ),
        controller: controller,
        cursorHeight: 25,
        style: appstyle(14, kDark, FontWeight.w500),
        validator: validator,
      ),
    );
  }
}
