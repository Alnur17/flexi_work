import 'dart:convert';
import 'dart:io';

import 'package:flexi_work/app/modules/user/profile/model/content_response_model.dart';
import 'package:flexi_work/app/modules/user/profile/model/profile_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/local_store/local_store.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';
import '../../../auth/login/model/login_response_model.dart';
import '../../../auth/login/views/login_view.dart';

class ProfileController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<ProfileResponseModel> profileResponseModel = ProfileResponseModel().obs;
  Rx<ContentResponseModel> contentResponseModel = ContentResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel(success: null, message: null, data: null).obs;
  Rx<File> imageFile = File("").obs;

  Rx<TextEditingController> currentPasswordController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;

  RxBool isChangePassword = false.obs;
  RxBool obscureText = true.obs;
  RxBool currentObscureText = true.obs;
  RxBool confirmObscureText = true.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> contactController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await checkTheProfileResponse();
      await getContentController();
      if(profileResponseModel.value.data == null) {
        await getUserProfileController();
      }
    });
  }

  Future getUserProfileController() async {
    try {
      isLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.getProfileResponse,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        profileResponseModel.value = ProfileResponseModel.fromJson(responseBody);
        LocalStorage.saveData(key: AppConstant.getProfileResponse, data: jsonEncode(responseBody));
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  Future<void> checkTheProfileResponse() async {
    if(LocalStorage.getData(key: AppConstant.getProfileResponse) != null) {
      isLoading(false);
      profileResponseModel.value = ProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getProfileResponse)));
      nameController.value.text = profileResponseModel.value.data?.name;
      emailController.value.text = profileResponseModel.value.data?.email;
      contactController.value.text = profileResponseModel.value.data?.contactNumber;
    } else {
      profileResponseModel.value = ProfileResponseModel();
    }
  }


  Future profileUpdateController ({
    File? image,
    required String fullName,
    required String email,
    required String contactNumber,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {
      // Create a multipart request
      isSubmit(true);


      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${loginResponseModel.value.data!.accessToken}',
      };

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.userProfileUpdate),
      );

      request.headers.addAll(headers);

      // Prepare the data map
      Map<String,dynamic> data = {
        "name": fullName,
        "contactNumber": contactNumber,
        "email": email
      };

      print(jsonEncode(data));

      // Add JSON data as a field
      request.fields['data'] = jsonEncode(data);

      // Add the image file if provided
      if (image?.path != "") {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image', // Field name expected by the server
            image!.path,
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
        isSubmit(false);
        await getUserProfileController();
      } else {
        isSubmit(false);
        onFail(responseData['message']);
      }
    } catch (e) {
      isSubmit(false);
      onExceptionFail(e.toString());
    }
  }


  Future changePasswordController({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      isChangePassword(true);

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var map = {
        "oldPassword": oldPassword,
        "newPassword": newPassword
      };


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.userChangePassword,
          headers: headers,
          body: jsonEncode(map), // Encode map to JSON string
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        LocalStorage.removeData(key: AppConstant.token);
        LocalStorage.removeData(key: AppConstant.getProfileResponse);
        Get.offAll(()=> LoginView());
      } else {
        throw "Resend otp is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Resend otp is Failed: $e", bgColor: AppColors.red);
    } finally {
      isChangePassword(false);
    }
  }


  Future getContentController() async {
    try {
      isLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.getContentResponse,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        contentResponseModel.value = ContentResponseModel.fromJson(responseBody);
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

}
