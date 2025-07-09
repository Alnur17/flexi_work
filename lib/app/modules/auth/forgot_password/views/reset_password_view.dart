import 'package:flexi_work/app/modules/auth/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ResetPasswordView extends GetView {
  ResetPasswordView({super.key,required this.email});

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
  final String email;

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
            Obx(()=>CustomTextField(
              hintText: '**********',
              obscureText: forgotPasswordController.obscureText.value,
              sufIcon: InkWell(
                onTap: () {
                  if(forgotPasswordController.obscureText.value == false) {
                    forgotPasswordController.obscureText.value = true;
                  } else {
                    forgotPasswordController.obscureText.value = false;
                  }
                },
                child: Image.asset(
                  forgotPasswordController.obscureText.value == true ? AppImages.eyeClose : AppImages.eyeOpen,
                  scale: 4,
                ),
              ),
              controller: forgotPasswordController.passwordController.value,
            ),),
            sh16,
            Text(
              'Confirm Password',
              style: h4,
            ),
            sh12,
            Obx(()=>CustomTextField(
              obscureText: forgotPasswordController.confirmObscureText.value,
              sufIcon: InkWell(
                onTap: () {
                  if(forgotPasswordController.confirmObscureText.value == false) {
                    forgotPasswordController.confirmObscureText.value = true;
                  } else {
                    forgotPasswordController.confirmObscureText.value = false;
                  }
                },
                child: Image.asset(
                  forgotPasswordController.confirmObscureText.value == true ? AppImages.eyeClose : AppImages.eyeOpen,
                  scale: 4,
                ),
              ),
              hintText: '**********',
              controller: forgotPasswordController.confirmPasswordController.value,
            )),
            sh16,

            Obx(()=>CustomButton(
              text: forgotPasswordController.isChangePassword.value == true ? 'Submitting....' : 'Update Password',
              onPressed: () async {
                await forgotPasswordController.checkTheRegistrationLogin();
                print(forgotPasswordController.forgotPasswordResponseModel.value.data?.token);
                if(forgotPasswordController.forgotPasswordResponseModel.value.data?.token != null) {
                  await forgotPasswordController.resetPasswordController(
                    accessToken: forgotPasswordController.forgotPasswordResponseModel.value.data!.token!,
                    email: email,
                    newPassword: forgotPasswordController.passwordController.value.text,
                    confirmPassword: forgotPasswordController.confirmPasswordController.value.text,
                  );
                }
              },
              gradientColors: AppColors.gradientColor,
            ),),
          ],
        ),
      ),
    );
  }
}
