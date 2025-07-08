import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flexi_work/app/modules/auth/signup/views/verify_your_email_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';

class SignupController extends GetxController {
  var selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  RxBool isLoading = false.obs;


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
        Get.offAll(() => const VerifyYourEmailView());
      } else {
        isLoading(false);
        onFail(responseData['message']);
      }
    } catch (e) {
      isLoading(false);
      onExceptionFail(e.toString());
    }
  }


}
