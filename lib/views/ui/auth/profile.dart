import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'package:practice_job_app_fl/views/common/app_bar.dart';
import 'package:practice_job_app_fl/views/common/drawer/drawerWidget.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
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
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const Drawerwidget(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: widthAppConstant,
              height: hieghtAppConstant * 0.12,
              color: kLight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            width: 80.w, // Diameter lingkaran
                            height: 80
                                .w, // Sama dengan lebar agar bentuk tetap bulat
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png", // Gambar profil PNG
                            fit: BoxFit
                                .cover, // Memastikan gambar terisi penuh dalam lingkaran
                            placeholder: (context, url) => CircleAvatar(
                              radius: 40.w, // Placeholder berbentuk lingkaran
                              backgroundColor: Colors.grey[200],
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 2.0,
                              ),
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: 40.w, // Fallback jika gambar gagal dimuat
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                size: 40.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          Icon(
                            MaterialIcons.location_pin,
                            color: kDarkGrey,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          ReusableText(
                            text: "Jakarta",
                            style: appstyle(16, kDarkGrey, FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Feather.edit,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
