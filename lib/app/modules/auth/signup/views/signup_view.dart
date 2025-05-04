import 'package:flexi_work/app/modules/auth/signup/views/verify_your_email_view.dart';
import 'package:flexi_work/common/helper/signup_body_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
        backgroundColor: AppColors.mainColor,
        // leading: GestureDetector(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: Image.asset(
        //     AppImages.back,
        //     scale: 4,
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sh12,
              Text(
                'Get Started Now',
                style: h2.copyWith(fontWeight: FontWeight.w700),
              ),
              sh12,
              Text(
                'Creat an account to explore about our app',
                style: h4,
              ),
              sh30,
              Text('Choose Your Role',style: h3,),
              sh12,
              SignupBodyWidget(),
              sh20,
              Row(
                children: [
                  Image.asset(
                    AppImages.checkBoxFilled,
                    scale: 4,
                  ),
                  sw16,
                  Expanded(
                    child: Text(
                      'I agree to the Terms & Conditions and Privacy Policy',
                      style: h4,
                    ),
                  ),
                ],
              ),
              sh20,
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Get.offAll(() => const VerifyYourEmailView());
                },
                gradientColors: AppColors.gradientColor,
              ),
              sh10,
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const LoginView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: h4,
                    ),
                    Text(
                      'Login',
                      style: h4.copyWith(color: AppColors.textColorBlue),
                    ),
                  ],
                ),
              ),
              sh30,
            ],
          ),
        ),
      ),
    );
  }
}
