import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TeamScoor extends StatelessWidget {
  final String title;
  final String image;

  const TeamScoor(
      {super.key,
      required this.title,
      required this.image,
     });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 80.h,
          width: 80.w,
        ),
        CachedNetworkImage( height: 65.h, width: 65.w, imageUrl: image,),
        // Positioned(
        //     bottom: 30,
        //     right: 10,
        //     child: Image.asset(
        //      subimage,
        //       height: 13.h,
        //       width: 13.w,
        //     )),
        // Positioned(
        //   bottom: 0,
        //   child: CustomTextPopins(
        //     text: title,
        //     color: AppColor.blackborder,
        //     size: 12.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }
}
