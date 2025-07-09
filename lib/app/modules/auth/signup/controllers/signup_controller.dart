import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flexi_work/app/modules/auth/login/views/login_view.dart';
import 'package:flexi_work/app/modules/auth/signup/views/verify_your_email_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/local_store/local_store.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';
import '../../../user/user_dashboard/views/user_dashboard_view.dart';
import '../model/registration_response_model.dart';

class SignupController extends GetxController {
  var selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isResendOtp = false.obs;
  RxString otpText = "".obs;
  RxBool obscureText = true.obs;
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

  Rx<RegistrationResponseModel> registrationResponseModel = RegistrationResponseModel().obs;


  //user sign up
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> birthDateController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;


  Future signUpController ({
    File? image,
    required String fullName,
    required String email,
    required String password,
    required String contactNumber,
    required String dobDate,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {
      // Create a multipart request
      isLoading(true);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.userRegister),
      );

      // Prepare the data map
      Map<String,dynamic> data = {
        "name": fullName,
        "email": email,
        "password": password,
        "dobDate": dobDate,
        "contactNumber": contactNumber,
      };

      print(jsonEncode(data));

      // Add JSON data as a field
      request.fields['data'] = jsonEncode(data);

      // Add the image file if provided
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image', // Field name expected by the server
            image.path,
            filename: image.path.split('/').last,
          ),
        );
      } else {
        request.fields['image'] = ''; // Empty string if no image
      }

      // Send the request
      var response = await request.send();

      // Get the response body
      String responseBody = await response.stream.bytesToString();
      var responseData = jsonDecode(responseBody);
      print(jsonEncode(responseData));
      // Check the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Store response in shared preferences
        onSuccess(responseData['message']);
        isLoading(false);
        LocalStorage.saveData(key: AppConstant.registrationApiResponse, data: jsonEncode(responseData));
        Get.to(() => VerifyYourEmailView(email: email,));
        timeCounter.value = 120;
        await otpTimer();
      } else {
        isLoading(false);
        onFail(responseData['message']);
      }
    } catch (e) {
      isLoading(false);
      onExceptionFail(e.toString());
    }
  }


  Future<void> checkTheRegistrationLogin() async {
    if(LocalStorage.getData(key: AppConstant.registrationApiResponse) != null) {
      registrationResponseModel.value = RegistrationResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.registrationApiResponse)));
    } else {
      registrationResponseModel.value = RegistrationResponseModel();
    }
  }


  Future otpVerificationController({
    required String otp,
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
          api: Api.userRegisterVerify,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        String token = responseBody['data']['accessToken'].toString();
        log(token);
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.off(() => LoginView());
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



  Future resentOtpController({
    required String email,
  }) async {
    try {
      isResendOtp(true);

      var map = {
        "email": email,
      };


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.userResendOtp,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.off(() => VerifyYourEmailView(email: email,),preventDuplicates: true);
        timeCounter.value = 120;
        await otpTimer();
      } else {
        throw "Resend Otp is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Resend Otp is Failed: $e", bgColor: AppColors.red);
    } finally {
      isResendOtp(false);
    }
  }


}
