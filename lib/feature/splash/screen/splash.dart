import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding:  EdgeInsets.all(20.r),
        child: Center(
          child: Image.asset(ImagePath.logo),
        ),
      ),
    );
  }
}
