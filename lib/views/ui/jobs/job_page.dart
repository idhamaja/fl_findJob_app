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

                // Profile Job Section
                // Profile Job Section (Perbaikan)
                Container(
                  width: widthAppConstant,
                  height: hieghtAppConstant * 0.32, // Perbesar tinggi container
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.h), // Kurangi padding vertikal
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Tambahkan ini agar fleksibel
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Ubah menjadi start
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                        radius: 40,
                      ),
                      HeightSpacer(size: 10),
                      ReusableText(
                        text: "Senior Flutter Developer",
                        style: appstyle(22, kDark, FontWeight.w600),
                      ),
                      HeightSpacer(size: 5),
                      ReusableText(
                        text: "Jakarta",
                        style: appstyle(16, kDarkGrey, FontWeight.normal),
                      ),
                      HeightSpacer(size: 10), // Tambahkan ruang ekstra
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                              width: widthAppConstant * 0.26,
                              height: hieghtAppConstant *
                                  0.05, // Sesuaikan tinggi tombol
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
                                SizedBox(width: 8.w),
                                ReusableText(
                                  text: "/monthly",
                                  style: appstyle(15, kDark, FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                HeightSpacer(size: 20),

                // Job Description Section
                ReusableText(
                  text: "Job Description",
                  style: appstyle(22, kDark, FontWeight.w600),
                ),
                HeightSpacer(size: 10),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    desc,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: appstyle(16, kDarkGrey, FontWeight.normal),
                  ),
                ),

                HeightSpacer(size: 20),

                // Job Requirements Section
                ReusableText(
                  text: "Requirements",
                  style: appstyle(22, kDark, FontWeight.w600),
                ),
                HeightSpacer(size: 10),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: hieghtAppConstant * 0.6,
                    child: ListView.builder(
                      itemCount: requirements.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final req = requirements[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("• ",
                                  style: appstyle(
                                      16, kDarkGrey, FontWeight.normal)),
                              Expanded(
                                child: Text(
                                  req,
                                  textAlign: TextAlign.justify,
                                  style: appstyle(
                                      16, kDarkGrey, FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                HeightSpacer(size: 20),
              ],
            ),

            // Apply Now Button
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
            ),
          ],
        ),
      ),
    );
  }
}
