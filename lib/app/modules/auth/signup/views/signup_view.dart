import 'package:flexi_work/common/helper/signup_body_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView {
  SignupView({super.key});

  SignupController signupController = Get.put(SignupController());

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
              Obx(()=> CustomButton(
                text: signupController.isLoading.value == true ? "Submitting ...." : 'Sign Up',
                onPressed: () async {
                  if(signupController.selectedRole.value == "user") {
                    if(signupController.fullNameController.value.text == "") {
                      kSnackBar(message: "Please enter your full name", bgColor: AppColors.red);
                    } else if(signupController.emailController.value.text == "") {
                      kSnackBar(message: "Please enter your email", bgColor: AppColors.red);
                    } else if(signupController.passwordController.value.text == "") {
                      kSnackBar(message: "Please enter your password", bgColor: AppColors.red);
                    } else if(signupController.passwordController.value.text.length < 8) {
                      kSnackBar(message: "Password must be at least 8 characters", bgColor: AppColors.red);
                    } else if(signupController.mobileNumberController.value.text == "") {
                      kSnackBar(message: "Please enter your mobile number", bgColor: AppColors.red);
                    } else if(signupController.birthDateController.value.text == "") {
                      kSnackBar(message: "Please enter your birth of date", bgColor: AppColors.red);
                    } else {
                      await signupController.signUpController(
                        fullName: signupController.fullNameController.value.text,
                        email: signupController.emailController.value.text,
                        password: signupController.passwordController.value.text,
                        contactNumber: signupController.mobileNumberController.value.text,
                        dobDate: signupController.birthDateController.value.text,
                        onSuccess: (e) async {
                          kSnackBar(message: "$e", bgColor: AppColors.green);
                        },
                        onFail: (e) async {
                          kSnackBar(message: "$e", bgColor: AppColors.red);
                        },
                        onExceptionFail: (e) async {
                          kSnackBar(message: "$e", bgColor: AppColors.red);
                        },
                      );
                    }
                  } else if(signupController.selectedRole.value == "vendor") {
                    if(signupController.fullNameController.value.text == "") {
                      kSnackBar(message: "Please enter your full name", bgColor: AppColors.red);
                    } else if(signupController.emailController.value.text == "") {
                      kSnackBar(message: "Please enter your email", bgColor: AppColors.red);
                    } else if(signupController.passwordController.value.text == "") {
                      kSnackBar(message: "Please enter your password", bgColor: AppColors.red);
                    } else if(signupController.passwordController.value.text.length < 8) {
                      kSnackBar(message: "Password must be at least 8 characters", bgColor: AppColors.red);
                    } else if(signupController.mobileNumberController.value.text == "") {
                      kSnackBar(message: "Please enter your mobile number", bgColor: AppColors.red);
                    } else if(signupController.birthDateController.value.text == "") {
                      kSnackBar(message: "Please enter your birth of date", bgColor: AppColors.red);
                    } else if(signupController.legalId.value.path == "") {
                      kSnackBar(message: "Please upload legal Id", bgColor: AppColors.red);
                    } else {
                      await signupController.vendorSignUpController(
                        legalId: signupController.legalId.value,
                        fullName: signupController.fullNameController.value.text,
                        email: signupController.emailController.value.text,
                        password: signupController.passwordController.value.text,
                        contactNumber: signupController.mobileNumberController.value.text,
                        dobDate: signupController.birthDateController.value.text,
                        onSuccess: (e) async {
                          kSnackBar(message: "$e", bgColor: AppColors.green);
                        },
                        onFail: (e) async {
                          kSnackBar(message: "$e", bgColor: AppColors.red);
                        },
                        onExceptionFail: (e) async {
                          kSnackBar(message: "$e", bgColor: AppColors.red);
                        },
                      );
                    }
                  } else if(signupController.selectedRole.value == "service_provider") {
                    print("all service_provider");
                  }

                },
                gradientColors: AppColors.gradientColor,
              ),),
              sh10,
              GestureDetector(
                onTap: () {
                  Get.offAll(() =>  LoginView());
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
