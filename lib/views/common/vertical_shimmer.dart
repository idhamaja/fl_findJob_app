import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';

class VerticalShimmer extends StatelessWidget {
  const VerticalShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        ShimmerEffect(
            curve: Curves.easeInBack,
            duration: const Duration(seconds: 7),
            colors: [
              kLightGrey,
              kLightBlue,
              kLightGrey,
            ]),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: heightExport * 0.15,
        width: widthAppConstant,
        color: kLightGrey,
      ),
    );
  }
}
