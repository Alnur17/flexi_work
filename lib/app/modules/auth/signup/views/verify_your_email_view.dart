import 'dart:developer';

import 'package:flexi_work/app/modules/auth/signup/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../controllers/signup_controller.dart';

class VerifyYourEmailView extends GetView {
  VerifyYourEmailView({super.key,required,required this.email});

  final SignupController signupController = Get.put(SignupController());
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Verify Your Email'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.off(()=>SignupView());
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
              onCompleted: (v) {
                signupController.otpText.value = v;
              },
              onChanged: (value) {
                signupController.otpText.value = value;
              },
              beforeTextPaste: (text) {
                log("Allowing to paste $text");
                return true;
              },
              appContext: context,
            ),
            sh20,
            Obx(()=>CustomButton(
              text: signupController.isSubmit.value == true ? 'Verifying... ' : 'Verify',
              onPressed: () async {
                print(email);
                print(signupController.otpText.value);
                String userRole = signupController.selectedRole.value;
                print(userRole);
                if(userRole == 'user') {
                  await signupController.checkTheRegistrationLogin();
                  print(signupController.registrationResponseModel.value.data?.otpToken?.token);
                  if(signupController.registrationResponseModel.value.data?.otpToken?.token != null) {
                    await signupController.otpVerificationController(
                      otp: signupController.otpText.value,
                      accessToken: signupController.registrationResponseModel.value.data?.otpToken?.token,
                    );
                  }
                } else if(userRole == 'vendor') {
                  await signupController.checkTheRegistrationLogin();
                  print(signupController.registrationResponseModel.value.data?.otpToken?.token);
                  if(signupController.registrationResponseModel.value.data?.otpToken?.token != null) {
                    await signupController.otpVerificationController(
                      otp: signupController.otpText.value,
                      accessToken: signupController.registrationResponseModel.value.data?.otpToken?.token,
                    );
                  }
                }
                //if (isOtpValid) {
                // Get selected role from SignupController
                //String userRole = signupController.selectedRole.value;

                // Navigate to the appropriate dashboard
                // switch (userRole) {
                //   case 'user':
                //     Get.offAll(() => UserDashboardView());
                //     break;
                //   case 'vendor':
                //     Get.offAll(() => VendorDashboardView());
                //     break;
                //   case 'service_provider':
                //     Get.offAll(() => ServiceProviderDashboardView());
                //     break;
                //   default:
                //     Get.offAll(() =>  LoginView());
                //     break;
                // }
                // } else {
                // // Show error if OTP is invalid
                // Get.snackbar('Error', 'Invalid OTP. Please try again.');
                // }
              },
              gradientColors: AppColors.gradientColor,
            ),),
            sh30,

            Obx(()=>InkWell(
              onTap: signupController.timeCounter.value > 0 ? null : () async {
                await signupController.resentOtpController(email: email);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t receive any code?',
                    style: h3,
                  ),
                  sw8,
                  signupController.timeCounter.value > 0 ?
                  Text(
                    '${signupController.timeCounter.value} s',
                    style: h3.copyWith(color: AppColors.textColorBlue),
                  ) :
                  Text(
                    signupController.isResendOtp.value == true ? 'Resending .... ' : 'Resend code',
                    style: h3.copyWith(color: AppColors.textColorBlue),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
