import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice_job_app_fl/controllers/exports.dart';
import 'package:provider/provider.dart';
import 'package:practice_job_app_fl/views/common/app_bar.dart';
import 'package:practice_job_app_fl/views/common/drawer/drawerWidget.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';
import 'package:practice_job_app_fl/views/ui/device_mgt/widgets/device_info.dart';
import 'package:practice_job_app_fl/views/ui/onboarding/onboarding_screen.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);
    var loginNotifier = Provider.of<LoginNotifier>(context);
    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Device Management Page",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const Drawerwidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeightSpacer(size: 50),
                  Text(
                    "You are logged in into your account on these devices",
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  const HeightSpacer(size: 50),
                  DevicesInfo(
                    date: loginDate,
                    device: "Macbook M2",
                    ipAdress: "10.0.12.000",
                    location: "Jakarta, Indonesia",
                    platform: "Apple Webkit",
                  ),
                  const HeightSpacer(size: 50),
                  DevicesInfo(
                    date: loginDate,
                    device: "iPhone 15",
                    ipAdress: "10.0.12.000",
                    location: "Jakarta, Indonesia",
                    platform: "Mobile App",
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () async {
                  // Reset state
                  zoomNotifier.currentIndex = 0;
                  onBoardNotifier.isLastPage = false;

                  // Clear any local data (e.g., token, user info)
                  await loginNotifier.logout();

                  // Navigate to OnBoardingScreen and remove all previous routes
                  Get.offAll(() => const OnBoardingScreen());
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ReusableText(
                    text: "Sign Out of all devices",
                    style: appstyle(16, kOrange, FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
