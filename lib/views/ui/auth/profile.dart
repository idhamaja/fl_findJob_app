import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:practice_job_app_fl/views/common/app_bar.dart';
import 'package:practice_job_app_fl/views/common/drawer/drawerWidget.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';
import 'package:practice_job_app_fl/views/common/width_spacer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Profile Page",
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const Drawerwidget(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Profile Section
                  Container(
                    width: widthAppConstant,
                    height: hieghtAppConstant * 0.12,
                    decoration: BoxDecoration(
                      color: kLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            width: 80.w,
                            height: 80.w,
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => CircleAvatar(
                              radius: 40.w,
                              backgroundColor: Colors.grey[200],
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 2.0,
                              ),
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: 40.w,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                size: 40.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                              text: "Cucung Sukardi",
                              style: appstyle(20, kDark, FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Icon(MaterialIcons.location_pin,
                                    color: kDarkGrey),
                                SizedBox(width: 5.w),
                                ReusableText(
                                  text: "Jakarta",
                                  style:
                                      appstyle(16, kDarkGrey, FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Feather.edit, size: 18),
                        )
                      ],
                    ),
                  ),

                  HeightSpacer(size: 20),

                  // Resume Section
                  Stack(
                    children: [
                      Container(
                        width: widthAppConstant,
                        height: hieghtAppConstant * 0.12,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: kLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                FontAwesome5Regular.file_pdf,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableText(
                                  text: "Resume from JobHub",
                                  style: appstyle(18, kDark, FontWeight.w500),
                                ),
                                SizedBox(height: 4.h),
                                ReusableText(
                                  text: "JobHub Resume",
                                  style: appstyle(16, kDark, FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 2.h,
                        right: 5.w,
                        child: GestureDetector(
                          onTap: () {},
                          child: ReusableText(
                            text: "Edit",
                            style: appstyle(16, kOrange, FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),

                  HeightSpacer(size: 20),

                  // Email Section
                  Container(
                    padding: EdgeInsets.only(left: 8.w),
                    width: widthAppConstant,
                    height: hieghtAppConstant * 0.06,
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ReusableText(
                        text: "cucungsukardi123@gmail.com",
                        style: appstyle(16, kDark, FontWeight.w600),
                      ),
                    ),
                  ),

                  HeightSpacer(size: 20),

                  // Phone Number Section
                  Container(
                    padding: EdgeInsets.only(left: 8.w),
                    width: widthAppConstant,
                    height: hieghtAppConstant * 0.06,
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/indonesia.svg",
                            width: 20.w,
                            height: 20.h,
                          ),
                          const WidthSpacer(size: 10),
                          ReusableText(
                            text: "+62852123456789",
                            style: appstyle(16, kDark, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),

                  HeightSpacer(size: 20),

                  // Skills Section
                  Container(
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(
                          10), // Tambahkan borderRadius di sini
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.h),
                          child: ReusableText(
                            text: "Skills",
                            style: appstyle(16, kDark, FontWeight.w600),
                          ),
                        ),
                        HeightSpacer(size: 3),
                        SizedBox(
                          height: hieghtAppConstant * 0.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            child: ListView.builder(
                              itemCount: skills.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final skill = skills[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.h),
                                    width: widthAppConstant,
                                    height: hieghtAppConstant * 0.06,
                                    decoration: BoxDecoration(
                                      color: kLight,
                                      borderRadius: BorderRadius.circular(
                                          8), // BorderRadius untuk setiap item skill
                                    ),
                                    child: ReusableText(
                                      text: skill,
                                      style: appstyle(
                                        16,
                                        kDark,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
