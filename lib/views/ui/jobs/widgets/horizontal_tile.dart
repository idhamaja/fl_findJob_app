import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';
import 'package:practice_job_app_fl/views/common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          width: widthAppConstant * 0.7,
          height: hieghtAppConstant * 0.27,
          decoration: BoxDecoration(
            color: kLightGrey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/Facebook.png",
                    ),
                  ),
                  WidthSpacer(size: 15),
                  ReusableText(
                    text: "Facebook",
                    style: appstyle(20, kDark, FontWeight.w600),
                  ),
                ],
              ),
              const HeightSpacer(size: 15),
              ReusableText(
                text: "Senior Flutter Developer",
                style: appstyle(20, kDark, FontWeight.w600),
              ),
              ReusableText(
                text: "Washington DC",
                style: appstyle(16, kDark, FontWeight.w600),
              ),
              const HeightSpacer(size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(
                        text: "15k",
                        style: appstyle(20, kDark, FontWeight.w600),
                      ),
                      ReusableText(
                        text: "/monthly",
                        style: appstyle(23, kDarkGrey, FontWeight.w600),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: kLight,
                    child: const Icon(Ionicons.chevron_forward),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
