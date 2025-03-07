import 'package:flutter/material.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
  });

  final String text;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kOrange,
        width: widthAppConstant,
        height: hieghtAppConstant * 0.065,
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(16, color ?? kLight, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
