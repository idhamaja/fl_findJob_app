import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/app_bar.dart';
import 'package:practice_job_app_fl/views/common/custom_textfield.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: "Login",
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  CupertinoIcons.arrow_left,
                ),
              ),
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const HeightSpacer(size: 50),
              ReusableText(
                text: "Welcome Back!",
                style: appstyle(30, kDark, FontWeight.w600),
              ),
              ReusableText(
                text: "Fill the details to login to your account",
                style: appstyle(16, kDarkGrey, FontWeight.w600),
              ),
              const HeightSpacer(size: 50),
              CustomTextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                validator: (email) {
                  if (email!.isEmpty || email.contains("@")) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              HeightSpacer(size: 20),
              CustomTextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Password",
                validator: (password) {
                  if (password!.isEmpty || password.length < 7) {
                    return "Please enter a valid password";
                  } else {
                    return null;
                  }
                },
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.visibility,
                    color: kDark,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
