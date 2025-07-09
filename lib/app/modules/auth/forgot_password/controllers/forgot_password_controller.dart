import 'dart:convert';
import 'dart:developer';

import 'package:flexi_work/app/modules/auth/forgot_password/model/forgot_password_response_model.dart';
import 'package:flexi_work/app/modules/auth/forgot_password/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/local_store/local_store.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';
import '../../login/views/login_view.dart';
import '../views/verify_otp_view.dart';

class ForgotPasswordController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isChangePassword = false.obs;
  RxBool obscureText = true.obs;
  RxBool confirmObscureText = true.obs;
  RxString otpText = "".obs;

  Rx<ForgotPasswordResponseModel> forgotPasswordResponseModel = ForgotPasswordResponseModel().obs;

  RxInt timeCounter = 120.obs;


  Future<void> otpTimer() async {
    Future.delayed(Duration(seconds: 1), () async {
      if(timeCounter > 0) {
        timeCounter.value = timeCounter.value - 1;
        otpTimer();
      } else {
        timeCounter.value = 0;
        print(timeCounter.value);
      }
    });
  }


  // Sign In
  Future forgotController({
    required String email,
  }) async {
    try {
      isLoading(true);

      var map = {
        "email": email,
      };
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resendOtp,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        LocalStorage.saveData(key: AppConstant.resendOtpApiResponse, data: jsonEncode(responseBody));
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(() => VerifyOtpView(email: email,));
        timeCounter.value = 120;
        await otpTimer();
      } else {
        throw "Resend otp is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Resend otp is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  Future<void> checkTheRegistrationLogin() async {
    if(LocalStorage.getData(key: AppConstant.resendOtpApiResponse) != null) {
      forgotPasswordResponseModel.value = ForgotPasswordResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.resendOtpApiResponse)));
    } else {
      forgotPasswordResponseModel.value = ForgotPasswordResponseModel();
    }
  }


  Future otpVerificationController({
    required String otp,
    required String email,
    required String accessToken
  }) async {
    try {
      isSubmit(true);

      var map = {
        "otp": otp,
      };


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.otpVerify,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        LocalStorage.saveData(key: AppConstant.resendOtpApiResponse, data: jsonEncode(responseBody));
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(() => ResetPasswordView(email: email,));
      } else {
        throw "Sign in Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Otp Verification is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }


  Future resetPasswordController({
    required String email,
    required String newPassword,
    required String confirmPassword,
    required String accessToken
  }) async {
    try {
      isChangePassword(true);

      var map = {
        "email": email,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      };


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resetPassword,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.offAll(()=> LoginView());
      } else {
        throw "Reset password is failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Reset password is failed: $e", bgColor: AppColors.red);
    } finally {
      isChangePassword(false);
    }
  }

}
