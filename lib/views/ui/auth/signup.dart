import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice_job_app_fl/controllers/exports.dart';
import 'package:practice_job_app_fl/views/ui/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:practice_job_app_fl/controllers/signup_provider.dart';
import 'package:practice_job_app_fl/views/common/app_bar.dart';
import 'package:practice_job_app_fl/views/common/custom_btn.dart';
import 'package:practice_job_app_fl/views/common/custom_textfield.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Consumer<SignUpNotifier>(builder: (context, signUpNotifier, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: "Sign Up",
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
                text: "Hello, Welcome!",
                style: appstyle(30, kDark, FontWeight.w600),
              ),
              ReusableText(
                text: "Fill the details to signup for an account",
                style: appstyle(16, kDarkGrey, FontWeight.w600),
              ),
              const HeightSpacer(size: 50),
              CustomTextField(
                controller: name,
                keyboardType: TextInputType.emailAddress,
                hintText: "Full name",
                validator: (name) {
                  if (name!.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
              ),
              HeightSpacer(size: 20),
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
                  if (signUpNotifier.passwordValidator(password ?? '')) {
                    return "Please enter a valid password with at least one upper case, one lowercase, one digit, a special character and length of 8 characters";
                  }
                  return null;
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    signUpNotifier.obscureText = !signUpNotifier.obscureText;
                  },
                  child: Icon(
                    signUpNotifier.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: kDark,
                  ),
                ),
              ),
              const HeightSpacer(size: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigation or action logic here
                    Get.to(() => const LoginPage());
                  },
                  child: ReusableText(
                    text: "Login",
                    style: appstyle(14, kDark, FontWeight.w500),
                  ),
                ),
              ),
              HeightSpacer(size: 50),
              CustomButton(
                onTap: () {
                  loginNotifier.firstTime = !loginNotifier.firstTime;
                },
                text: "Sign Up",
              )
            ],
          ),
        ),
      );
    });
  }
}
