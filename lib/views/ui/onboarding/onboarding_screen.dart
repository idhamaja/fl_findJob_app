import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:provider/provider.dart';
import 'package:practice_job_app_fl/controllers/exports.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/widgets/page_one.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/widgets/page_three.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardNotifier>(
        builder: (context, onBoardNotifier, child) {
          return Stack(
            children: [
              PageView(
                physics: onBoardNotifier.isLastPage
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (page) {
                  onBoardNotifier.isLastPage = page == 2;
                },
                children: const [
                  PageOne(),
                  PageTwo(),
                  PageThree(),
                ],
              ),
              Positioned(
                bottom: hieghtAppConstant * 0.08,
                left: 0,
                right: 0,
                child: onBoardNotifier.isLastPage
                    ? const SizedBox.shrink()
                    : Center(
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: WormEffect(
                            dotHeight: 12,
                            dotWidth: 12,
                            spacing: 10,
                            dotColor: kDarkGrey.withAlpha(128),
                            activeDotColor: kLight,
                          ),
                        ),
                      ),
              ),
              Positioned(
                child: onBoardNotifier.isLastPage
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 30.h,
                            horizontal: 20.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(2);
                                },
                                child: ReusableText(
                                  text: "Skip",
                                  style: appstyle(16, kLight, FontWeight.w500),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: ReusableText(
                                  text: "Next",
                                  style: appstyle(16, kLight, FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
