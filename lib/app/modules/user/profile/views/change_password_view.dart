import 'package:flexi_work/app/modules/user/profile/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/local_store/local_store.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_circular_container.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../auth/forgot_password/views/forgot_password_view.dart';
import '../../user_dashboard/views/user_dashboard_view.dart';
import '../controllers/profile_controller.dart';

class ChangePasswordView extends GetView {
  ChangePasswordView({super.key});


  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Change Password',
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () {
              Get.off(()=>SettingsView(),preventDuplicates: false);
            },
            padding: 2,
          ),
        ),
      ),
      body: Obx(()=>Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh30,
            CustomTextField(
              hintText: 'Current Password',
              obscureText: profileController.currentObscureText.value,
              sufIcon: InkWell(
                onTap: () {
                  if(profileController.currentObscureText.value == false) {
                    profileController.currentObscureText.value = true;
                  } else {
                    profileController.currentObscureText.value = false;
                  }
                },
                child: Image.asset(
                  profileController.currentObscureText.value == true ? AppImages.eyeClose : AppImages.eyeOpen,
                  scale: 4,
                ),
              ),
              controller:  profileController.currentPasswordController.value,
            ),
            sh16,
            CustomTextField(
              hintText: 'New Password',
              obscureText: profileController.obscureText.value,
              sufIcon: InkWell(
                onTap: () {
                  if(profileController.obscureText.value == false) {
                    profileController.obscureText.value = true;
                  } else {
                    profileController.obscureText.value = false;
                  }
                },
                child: Image.asset(
                  profileController.obscureText.value == true ? AppImages.eyeClose : AppImages.eyeOpen,
                  scale: 4,
                ),
              ),
              controller: profileController.passwordController.value,
            ),
            sh16,
            CustomTextField(
              hintText: 'Confirm New Password',
              obscureText: profileController.confirmObscureText.value,
              sufIcon: InkWell(
                onTap: () {
                  if(profileController.confirmObscureText.value == false) {
                    profileController.confirmObscureText.value = true;
                  } else {
                    profileController.confirmObscureText.value = false;
                  }
                },
                child: Image.asset(
                  profileController.confirmObscureText.value == true ? AppImages.eyeClose : AppImages.eyeOpen,
                  scale: 4,
                ),
              ),
              controller: profileController.confirmPasswordController.value,
            ),
            sh16,
            GestureDetector(
              onTap: () {
                LocalStorage.removeData(key: AppConstant.token);
                LocalStorage.removeData(key: AppConstant.getProfileResponse);
                Get.off(() => ForgotPasswordView(),preventDuplicates: false);
              },
              child: Text(
                'Forgot the password?',
                style: h5.copyWith(color: AppColors.red),
              ),
            ),
            sh30,
            CustomButton(
              text: profileController.isChangePassword.value == true ? 'Confirming....' : 'Confirm',
              onPressed: () async {
                await profileController.changePasswordController(
                  oldPassword: profileController.currentPasswordController.value.text,
                  newPassword:  profileController.passwordController.value.text,
                );
              },
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      )),
    );
  }
}