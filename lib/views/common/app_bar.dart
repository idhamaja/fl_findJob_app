import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.text,
    required this.child,
    this.actions,
  });

  final String? text;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      backgroundColor: kLight,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
        text: text ?? "",
        style: appstyle(16, kDark, FontWeight.w500),
      ),
    );
  }
}
