import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/custom_outline_btn.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';
import 'package:practice_job_app_fl/views/ui/auth/login.dart';
import 'package:practice_job_app_fl/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: widthAppConstant,
        height: hieghtAppConstant,
        color: kLightBlue,
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            const HeightSpacer(size: 20),
            ReusableText(
              text: "Welcome to JobHub",
              style: appstyle(
                30,
                kLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(size: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Text(
                "We help you find your dream job to your skillset, location and preference to build your career",
                textAlign: TextAlign.center,
                style: appstyle(14, kLight, FontWeight.normal),
              ),
            ),
            const HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineBtn(
                  width: widthAppConstant * 0.4,
                  height: hieghtAppConstant * 0.06,
                  text: "Login",
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setBool('entrypoint', true);
                    Get.to(() => const LoginPage());
                  },
                  color: kLight,
                  color2: kLightBlue,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegistrationPage());
                  },
                  child: Container(
                    width: widthAppConstant * 0.4,
                    height: hieghtAppConstant * 0.06,
                    color: kLight,
                    child: Center(
                      child: ReusableText(
                        text: "Sign Up",
                        style: appstyle(
                          16,
                          kLightBlue,
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const HeightSpacer(size: 30),
            ReusableText(
              text: "Continue as Guest",
              style: appstyle(16, kLight, FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
