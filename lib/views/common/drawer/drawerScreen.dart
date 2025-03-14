import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:practice_job_app_fl/controllers/zoom_provider.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';

import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;
  const DrawerScreen({Key? key, required this.indexSetter}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Widget drawerItems(
      IconData icon, String text, int index, Color color, Color txtcolor) {
    return GestureDetector(
      onTap: () {
        widget.indexSetter(index);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 12),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            ReusableText(
              text: text,
              style: appstyle(12, color, FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    return GestureDetector(
      onDoubleTap: () {
        ZoomDrawer.of(context)!.toggle();
      },
      child: Scaffold(
        backgroundColor: Color(kLightBlue2.value),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            drawerItems(
                AntDesign.home,
                "Home",
                0,
                zoomNotifier.currentIndex == 0
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
                zoomNotifier.currentIndex == 0
                    ? Color(kLight.value)
                    : Color(kLightGrey.value)),
            const HeightSpacer(size: 20),
            drawerItems(
                Ionicons.ios_chatbubble_outline,
                "Chat",
                1,
                zoomNotifier.currentIndex == 1
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value),
                zoomNotifier.currentIndex == 1
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value)),
            const HeightSpacer(size: 20),
            drawerItems(
                Fontisto.bookmark,
                "Bookmarks",
                2,
                zoomNotifier.currentIndex == 2
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value),
                zoomNotifier.currentIndex == 2
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value)),
            const HeightSpacer(size: 20),
            drawerItems(
                MaterialCommunityIcons.devices,
                "Device Mgmt",
                3,
                zoomNotifier.currentIndex == 3
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value),
                zoomNotifier.currentIndex == 3
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value)),
            const HeightSpacer(size: 20),
            drawerItems(
                FontAwesome5Regular.user_circle,
                "Profile",
                4,
                zoomNotifier.currentIndex == 4
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value),
                zoomNotifier.currentIndex == 4
                    ? Color(kLight.value)
                    : Color(kDarkGrey.value)),
          ],
        ),
      ),
    );
  }
}
