import 'package:flutter/material.dart';
import 'package:practice_job_app_fl/views/common/custom_outline_btn.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';

class DevicesInfo extends StatelessWidget {
  const DevicesInfo({
    super.key,
    required this.location,
    required this.device,
    required this.platform,
    required this.date,
    required this.ipAdress,
  });

  final String location;
  final String device;
  final String platform;
  final String date;
  final String ipAdress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: kLight,
          borderRadius:
              BorderRadius.circular(12), // BorderRadius untuk container
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: platform,
              style: appstyle(
                22,
                kDark,
                FontWeight.bold,
              ),
            ),
            ReusableText(
              text: device,
              style: appstyle(
                22,
                kDark,
                FontWeight.bold,
              ),
            ),
            const HeightSpacer(size: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: date,
                        style: appstyle(
                          16,
                          kDark,
                          FontWeight.w400,
                        ),
                      ),
                      ReusableText(
                        text: ipAdress,
                        style: appstyle(
                          16,
                          kDark,
                          FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(8), // BorderRadius untuk button
                  ),
                  child: CustomOutlineBtn(
                    text: "Sign Out",
                    color: kOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
