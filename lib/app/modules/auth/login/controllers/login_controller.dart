import 'dart:convert';
import 'dart:developer';

import 'package:flexi_work/app/data/api.dart';
import 'package:flexi_work/app/data/base_client.dart';
import 'package:flexi_work/app/modules/auth/login/model/login_response_model.dart';
import 'package:flexi_work/app/modules/user/user_dashboard/views/user_dashboard_view.dart';
import 'package:flexi_work/common/app_color/app_colors.dart';
import 'package:flexi_work/common/app_constant/app_constant.dart';
import 'package:flexi_work/common/local_store/local_store.dart';
import 'package:flexi_work/common/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel(success: null, message: null, data: null).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 1),() async {
      checkTheUserLogin();
    });
  }

  // Sign In
  Future signInController({
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);

      var map = {
        "email": email,
        "password": password,
      };
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.login,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        String token = responseBody['data']['accessToken'].toString();
        log(token);
        LocalStorage.saveData(key: AppConstant.token, data: jsonEncode(responseBody));
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(() => UserDashboardView());
      } else {
        throw "Sign in Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Sign in Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  Future<void> checkTheUserLogin() async {
    print(LocalStorage.getData(key: AppConstant.token));
    if(LocalStorage.getData(key: AppConstant.token) != null) {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));
      Map<String, dynamic> decodedToken = parseJwt(loginResponseModel.value.data!.accessToken!);
      if(decodedToken['role'] == "user") {
        Get.to(() => UserDashboardView());
      }
    } else {
      print("not register");
    }
  }






  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
      case 3:
        output += '=' * (4 - output.length % 4);
        break;
    }

    return utf8.decode(base64Url.decode(output));
  }



}