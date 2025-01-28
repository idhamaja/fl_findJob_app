import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/app_bar.dart';
import 'package:practice_job_app_fl/views/common/custom_outline_btn.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';

class JobPage extends StatefulWidget {
  const JobPage({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final String id;

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: widget.title,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Entypo.bookmark),
            ),
          ],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(size: 30),
                Container(
                  width: widthAppConstant,
                  height: hieghtAppConstant * 0.27,
                  color: kLightGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      const HeightSpacer(size: 10),
                      ReusableText(
                        text: "Senior Flutter Developer",
                        style: appstyle(22, kDark, FontWeight.w600),
                      ),
                      const HeightSpacer(size: 5),
                      ReusableText(
                        text: "Jakarta",
                        style: appstyle(16, kDarkGrey, FontWeight.normal),
                      ),
                      HeightSpacer(size: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                              width: widthAppConstant * 0.26,
                              height: hieghtAppConstant * 0.04,
                              color2: kLight,
                              text: "Full-time",
                              color: kOrange,
                            ),
                            Row(
                              children: [
                                ReusableText(
                                  text: "10k",
                                  style: appstyle(21, kDark, FontWeight.w600),
                                ),
                                SizedBox(
                                  width: widthAppConstant * 0.2,
                                  child: ReusableText(
                                    text: "/monthly",
                                    style: appstyle(15, kDark, FontWeight.w600),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                  text: "Job Description",
                  style: appstyle(22, kDark, FontWeight.w600),
                ),
                const HeightSpacer(size: 10),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: appstyle(16, kDarkGrey, FontWeight.normal),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                  text: "Requirements",
                  style: appstyle(22, kDark, FontWeight.w600),
                ),
                const HeightSpacer(size: 10),
                SizedBox(
                  height: hieghtAppConstant * 0.6,
                  child: ListView.builder(
                    itemCount: requirements.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final req = requirements[index];
                      String bullet = "\u2022";
                      return Text(
                        "$bullet $req\n",
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        style: appstyle(16, kDarkGrey, FontWeight.normal),
                      );
                    },
                  ),
                ),
                const HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomOutlineBtn(
                  onTap: () {},
                  color2: kOrange,
                  width: widthAppConstant,
                  height: hieghtAppConstant * 0.06,
                  text: "Apply Now",
                  color: kLight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
