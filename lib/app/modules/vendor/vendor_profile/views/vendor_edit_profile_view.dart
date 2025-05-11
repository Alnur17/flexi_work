import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class VendorEditProfileView extends GetView {
  const VendorEditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh20,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            NetworkImage(AppImages.profileImageTwo),
                      ),
                      Positioned(
                        bottom: -5,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            log("Add icon tapped");
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.orange,
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sh12,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Lukas Wagner',
                      style: h5.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  sh5,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'lukas.wagner@gmail.com',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ),
                ],
              ),
              sh20,
              Text(
                'Store Name',
                style: h5,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter store name',
              ),
              sh12,
              Text(
                'Owner Name',
                style: h5,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter your name',
              ),
              sh12,
              Text(
                'Email address',
                style: h5,
              ),
              sh8,
              CustomTextField(
                hintText: 'abc@gmail.com',
              ),
              sh12,
              Text(
                'Store Description',
                style: h5,
              ),
              sh8,
              CustomTextField(
                height: 100,
                hintText: 'Description',
              ),
              sh12,
              Text(
                'Contact',
                style: h5,
              ),
              sh8,
              CustomTextField(),
              sh12,
              Text(
                'Location',
                style: h5,
              ),
              sh8,
              CustomTextField(),
              sh60,
              CustomButton(
                text: 'Save',
                onPressed: () {},
                gradientColors: AppColors.gradientColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
