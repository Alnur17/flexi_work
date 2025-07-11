import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/local_store/local_store.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView {
  LoginView({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh12,
              Text(
                'Hi, Welcome back!',
                style: h2.copyWith(fontWeight: FontWeight.w700),
              ),
              sh12,
              Text(
                'Login to continue exploring the best deals',
                style: h4,
              ),
              sh30,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: h4),
                  sh8,
                  CustomTextField(
                    controller: loginController.emailController.value,
                    hintText: 'Your email',
                  ),
                  const SizedBox(height: 12),
                  Text('Password', style: h4),
                  sh8,
                  Obx(()=>CustomTextField(
                    obscureText: loginController.obscureText.value,
                    controller: loginController.passwordController.value,
                    sufIcon: InkWell(
                      onTap: () {
                        if(loginController.obscureText.value == false) {
                          loginController.obscureText.value = true;
                        } else {
                          loginController.obscureText.value = false;
                        }
                      },
                      child: Image.asset(
                        loginController.obscureText.value == true ? AppImages.eyeClose : AppImages.eyeOpen,
                        scale: 4,
                      ),
                    ),
                    hintText: '**********',

                  ),)
                ],
              ),
              sh16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Obx(()=>InkWell(
                    onTap: () {
                      if(loginController.isRememberMe.value == false) {
                        loginController.isRememberMe.value = true;
                      } else {
                        loginController.isRememberMe.value = false;
                        LocalStorage.removeData(key: AppConstant.localAuth);
                        loginController.emailController.value.clear();
                        loginController.passwordController.value.clear();
                      }
                    },
                    child: Row(
                      children: [
                        loginController.isRememberMe.value == false ?
                        Image.asset(
                          AppImages.checkBoxCircle,
                          scale: 4,
                        ) : Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.green),
                          ),
                          child: Center(
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                        sw16,
                        Text(
                          'Remember Me',
                          style: h4,
                        ),
                      ],
                    ),
                  ),),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => ForgotPasswordView());
                    },
                    child: Text(
                      'Forgot password?',
                      style: h4.copyWith(color: AppColors.red),
                    ),
                  ),
                ],
              ),
              sh24,
              Obx(() => CustomButton(
                text: loginController.isLoading.value ? 'Loading...' : 'Login',
                onPressed: () async {
                  if(loginController.emailController.value.text == "") {
                    kSnackBar(message: "Please enter the email", bgColor: AppColors.red);
                  } else if(loginController.passwordController.value.text == "") {
                    kSnackBar(message: "Please enter the password", bgColor: AppColors.red);
                  } else {
                    if(loginController.isRememberMe.value == true) {
                      Map<String,dynamic> data = {
                        "email": loginController.emailController.value.text.trim(),
                        "password": loginController.passwordController.value.text.trim(),
                      };
                      LocalStorage.saveData(key: AppConstant.localAuth, data: jsonEncode(data));
                      await loginController.signInController(
                        email: loginController.emailController.value.text.trim(),
                        password: loginController.passwordController.value.text.trim(),
                      );
                    } else {
                      await loginController.signInController(
                        email: loginController.emailController.value.text.trim(),
                        password: loginController.passwordController.value.text.trim(),
                      );
                    }
                  }
                },
                gradientColors: AppColors.gradientColor,
              )),
              sh10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: Divider()),
                  sw10,
                  Text(
                    'or',
                    style: h4,
                  ),
                  sw10,
                  const Expanded(child: Divider()),
                ],
              ),
              sh10,
              GestureDetector(
                onTap: () {
                  Get.to(() =>SignupView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: h4,
                    ),
                    Text(
                      'Sign Up',
                      style: h4.copyWith(color: AppColors.textColorBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}