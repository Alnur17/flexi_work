import 'package:flexi_work/common/app_color/app_colors.dart';
import 'package:flexi_work/common/widgets/custom_button.dart';
import 'package:flexi_work/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class VendorSupportView extends GetView {
  const VendorSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        title: const Text('Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Issue Title',
              style: h5,
            ),
            sh8,
            CustomTextField(),
            sh12,
            Text(
              'Description',
              style: h5,
            ),
            sh8,
            CustomTextField(
              hintText: 'Description here.. ',
              height: 100,
            ),
            sh20,
            CustomButton(
              text: 'Submit',
              onPressed: () {},
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }
}
