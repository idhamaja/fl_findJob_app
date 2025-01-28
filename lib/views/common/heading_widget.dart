import 'package:flutter/material.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          text: text,
          style: appstyle(20, kDark, FontWeight.w600),
        ),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
            text: "View all",
            style: appstyle(16, kOrange, FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
