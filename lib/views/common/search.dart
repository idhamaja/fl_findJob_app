import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: widthAppConstant * 0.84,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Feather.search,
                      color: kOrange,
                      size: 20,
                    ),
                    ReusableText(
                      text: "  Search for Job",
                      style: appstyle(18, kOrange, FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Icon(
                FontAwesome.sliders,
                color: kDarkGrey,
                size: 20.h,
              ),
            ],
          ),
          HeightSpacer(size: 7),
          Divider(
            color: kDarkGrey,
            thickness: 0.5,
            endIndent: 40.w,
          ),
        ],
      ),
    );
  }
}
