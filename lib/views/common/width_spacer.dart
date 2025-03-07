import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@override
class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.h,
    );
  }
}
