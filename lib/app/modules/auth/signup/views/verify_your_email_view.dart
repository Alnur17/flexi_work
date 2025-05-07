import 'dart:developer';

import 'package:flexi_work/app/modules/service_provider/service_provider_dashboard/views/service_provider_dashboard_view.dart';
import 'package:flexi_work/app/modules/user/user_dashboard/views/user_dashboard_view.dart';
import 'package:flexi_work/app/modules/vendor/vendor_dashboard/views/vendor_dashboard_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class VerifyYourEmailView extends GetView {
  const VerifyYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Verify Your Email'),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sh20,
            Text(
              'Enter OTP',
              style: h3,
            ),
            sh20,
            Text(
              'We have just sent you 6 digit code via your email.',
              style: h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 60,
                fieldWidth: 50,
                // Reduce the width slightly for the gap
                activeColor: AppColors.white,
                activeFillColor: AppColors.white,
                inactiveColor: AppColors.borderColor,
                inactiveFillColor: AppColors.white,
                selectedColor: AppColors.blue,
                selectedFillColor: AppColors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: AppColors.transparent,
              cursorColor: AppColors.blue,
              enablePinAutofill: true,
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                log("Allowing to paste $text");
                return true;
              },
              appContext: context,
            ),
            sh20,
            CustomButton(
              text: 'Verify',
              onPressed: () {
                //if (isOtpValid) {
                // Get selected role from SignupController
                String userRole = signupController.selectedRole.value;

                // Navigate to the appropriate dashboard
                switch (userRole) {
                  case 'user':
                    Get.offAll(() => UserDashboardView());
                    break;
                  case 'vendor':
                    Get.offAll(() => VendorDashboardView());
                    break;
                  case 'service_provider':
                    Get.offAll(() => ServiceProviderDashboardView());
                    break;
                  default:
                    Get.offAll(() => const LoginView());
                    break;
                }
                // } else {
                // // Show error if OTP is invalid
                // Get.snackbar('Error', 'Invalid OTP. Please try again.');
                // }
              },
              gradientColors: AppColors.gradientColor,
            ),
            sh30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t receive any code?',
                  style: h3,
                ),
                sw8,
                Text(
                  'Resend code',
                  style: h3.copyWith(color: AppColors.textColorBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
