import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: hieghtAppConstant * 0.15,
        width: widthAppConstant,
        decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: kLightGrey,
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/tokped.png"),
                    ),
                    WidthSpacer(
                      size: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: "Tokopedia",
                          style: appstyle(20, kDark, FontWeight.w600),
                        ),
                        SizedBox(
                          width: widthAppConstant * 0.5,
                          child: ReusableText(
                            text: "Senior Engineer",
                            style: appstyle(18, kDarkGrey, FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: kLight,
                      child: Icon(Ionicons.chevron_forward),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                  ReusableText(
                    text: "20k",
                    style: appstyle(23, kDark, FontWeight.w600),
                  ),
                  ReusableText(
                    text: "/monthly",
                    style: appstyle(23, kDark, FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
