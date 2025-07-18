import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/const_text/const_text.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class VendorAboutUsView extends GetView {
  const VendorAboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text('About Us'),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh30,
              // Text(
              //   'About Us',
              //   style: h2,
              // ),
              // sh24,
              Text(
                acceptance0fTerms,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                acceptance0fTerms,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                acceptance0fTerms,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                acceptance0fTerms,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                acceptance0fTerms,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                acceptance0fTerms,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
