import 'package:flexi_work/app/modules/user/user_dashboard/views/user_dashboard_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../../../common/widgets/google_button.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                  const CustomTextField(
                    hintText: 'Your email',
                  ),
                  const SizedBox(height: 12),
                  Text('Password', style: h4),
                  sh8,
                  CustomTextField(
                    sufIcon: Image.asset(
                      AppImages.eyeClose,
                      scale: 4,
                    ),
                    hintText: '**********',
                  ),
                ],
              ),
              sh16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.checkBoxCircle,
                          scale: 4,
                        ),
                      ),
                      sw16,
                      Text(
                        'Remember Me',
                        style: h4,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotPasswordView());
                    },
                    child: Text(
                      'Forgot password?',
                      style: h4.copyWith(color: AppColors.red),
                    ),
                  ),
                ],
              ),
              sh24,
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Get.to(()=> UserDashboardView());
                },
                gradientColors: AppColors.gradientColor,
              ),
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
              GoogleButton(
                assetPath: AppImages.google,
                label: 'Continue with Google',
                onTap: () {
                },
              ),
              sh20,
              GoogleButton(
                assetPath: AppImages.apple,
                label: 'Continue with Apple',
                onTap: () {

                },
              ),
              sh20,
              GoogleButton(
                assetPath: AppImages.facebook,
                label: 'Continue with Facebook',
                onTap: () {},
              ),
              sh10,
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignupView());
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
