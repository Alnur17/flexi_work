import 'dart:developer';

import 'package:flexi_work/app/modules/auth/forgot_password/views/forgot_password_view.dart';
import 'package:flexi_work/app/modules/auth/forgot_password/views/reset_password_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../controllers/forgot_password_controller.dart';

class VerifyOtpView extends GetView {
  VerifyOtpView({super.key,required this.email});


  final String email;

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('OTP Verification'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.to(()=>ForgotPasswordView());
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
              'Verify Your Identity',
              style: h3,
            ),
            sh20,
            Text(
              'For your security, verify the code sent to your registered contact. Let’s confirm it’s you!',
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
                forgotPasswordController.otpText.value = v;
              },
              onChanged: (value) {
                forgotPasswordController.otpText.value = value;
              },
              beforeTextPaste: (text) {
                log("Allowing to paste $text");
                return true;
              },
              appContext: context,
            ),
            sh20,
            Obx(()=>CustomButton(
              text: forgotPasswordController.isSubmit.value == true ? 'Submitting....' : 'Confirm',
              onPressed: () async {
                print(email);
                print(forgotPasswordController.otpText.value);
                await forgotPasswordController.checkTheRegistrationLogin();
                print(forgotPasswordController.forgotPasswordResponseModel.value.data?.token);
                if(forgotPasswordController.forgotPasswordResponseModel.value.data?.token != null) {
                  await forgotPasswordController.otpVerificationController(
                    otp: forgotPasswordController.otpText.value,
                    accessToken: forgotPasswordController.forgotPasswordResponseModel.value.data!.token!,
                    email: email,
                  );
                }
              },
              gradientColors: AppColors.gradientColor,
            ),),
            sh30,
            Obx(()=>InkWell(
              onTap: () async {
                await forgotPasswordController.forgotController(email: email);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t receive any code?',
                    style: h3,
                  ),
                  sw8,
                  forgotPasswordController.timeCounter.value > 0 ?
                  Text(
                    '${forgotPasswordController.timeCounter.value} s',
                    style: h3.copyWith(color: AppColors.textColorBlue),
                  ) :
                  Text(
                    forgotPasswordController.isLoading.value == true ? 'Resending .... ' : 'Resend code',
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
