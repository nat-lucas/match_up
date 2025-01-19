import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:match_up/feature/setting/widget/custom_text_expansion.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';


class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(ExpansionTileController());

    final faqData = [
      {
        'title': 'What is MacthUp?',
        'content': 'How about that know in this about MacthUp?',
      },
      {
        'title': 'What is MacthUp?',
        'content':
            'How about that know in this about MacthUp? How about that know in this about MacthUp?',
      },
      {
        'title': 'How do I create an account?',
        'content':
            'Simply download the app from App Store/Google Play, open it, and follow the on-screen instructions to sign up using your email or social media accounts.',
      },
      {
        'title': 'I forgot my password. What should I do?',
        'content':
            'How about that know in this about MacthUp? How about that know in this about MacthUp?',
      },
      {
        'title': 'How do I track my performance?',
        'content':
            'How about that know in this about MacthUp? How about that know in this about MacthUp?',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Help & Support",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: ListView.builder(
          itemCount: faqData.length,
          itemBuilder: (context, index) {
            final faq = faqData[index];
            return CustomExpansionTileText(
              title: faq['title']!,
              content: faq['content']!,
              index: index, // Pass the index to the tile
            );
          },
        ),
      ),
    );
  }
}
