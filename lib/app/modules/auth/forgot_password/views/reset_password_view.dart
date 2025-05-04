import 'package:flexi_work/app/modules/auth/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Reset Password'),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Set Your New Password',
                style: h3,
              ),
            ),
            sh16,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Create a new password to secure your account.',
                style: h5,
              ),
            ),
            sh16,
            Text(
              'Enter new password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              hintText: '**********',
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
            ),
            sh16,
            Text(
              'Confirm Password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
              hintText: '**********',
            ),
            sh16,
            CustomButton(
              text: 'Update Password',
              onPressed: () {
                Get.offAll(()=> LoginView());
              },
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }
}
