import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Legal and Policies",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Terms of Service'),
            const SizedBox(height: 8),
            CustomTextPopins(
              text: "Defines the rules for using the app.\nKey sections:",
              fontWeight: FontWeight.w400,
              size: 14.sp,
              color: Color(0xff636F85),
            ),
            const ListTileContent(
              items: [
                'Acceptance of Terms: Clear agreement from the user.',
                'Eligibility: Age and legal requirements for users.',
                'User Responsibilities: Rules around behavior, account usage, and prohibited activities.',
                'Content Ownership: Clarify who owns the content (e.g., user-generated vs. app-provided).',
                'Termination of Service: Reasons for account suspension or termination.',
                'Limitation of Liability: Limiting the app’s responsibility for damages.',
              ],
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Privacy Policy'),
            const SizedBox(height: 8),
            CustomTextPopins(
              text:
                  "Explains how the app collects, uses, stores, and protects personal data. Include:",
              fontWeight: FontWeight.w400,
              size: 14.sp,
              color: Color(0xff636F85),
            ),
            const ListTileContent(
              items: [
                'Data Collection: Types of data collected (e.g., location, fitness stats, payment info).',
                'Data Usage: Purposes (e.g., analytics, personalization, marketing).',
                'Sharing with Third Parties: Clarify partnerships and data-sharing practices.',
                'Data Security: Measures to protect user information.',
                'User Rights: Access, modification, or deletion of personal data.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class ListTileContent extends StatelessWidget {
  final List<String> items;

  const ListTileContent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  '\u2022',
                  style: TextStyle(fontSize: 18.sp),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextPopins(
                    text: item,
                    fontWeight: FontWeight.w400,
                    size: 14.sp,
                    color: Color(0xff636F85),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
