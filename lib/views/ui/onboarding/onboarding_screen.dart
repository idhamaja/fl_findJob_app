import 'package:flutter/material.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/widgets/page_one.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/widgets/page_three.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/widgets/page_two.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          children: [
            PageOne(),
            PageTwo(),
            PageThree(),
          ],
        )
      ]),
    );
  }
}
