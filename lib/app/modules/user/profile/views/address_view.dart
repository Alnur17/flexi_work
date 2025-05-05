import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/helper/address_card.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import 'add_address_view.dart';

class AddressView extends GetView {
  const AddressView({super.key});
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
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
        title: const Text('Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sh20,
              CustomButton(
                text: 'Add address',
                onPressed: () {
                  Get.to(() => AddAddressView());
                },
                imageAssetPath: AppImages.add,
                backgroundColor: AppColors.transparent,
                textColor: AppColors.black100,
                borderColor: AppColors.blue,
                borderRadius: 12,
                height: 66,
              ),
              sh12,
              AddressCard(
                title: 'Home',
                address: '123 Main Street, Berlin, Germany, 10115',
                isDefault: true,
                onEdit: () {
                  log('Edit tapped');
                },
                onLocation: () {
                  log('Location tapped');
                },
              ),
              sh12,
              AddressCard(
                title: 'Office',
                address: '456 Business Avenue, Hamburg, Germany, 20354',
                isDefault: false,
                onEdit: () {
                  log('Edit tapped');
                },
                onLocation: () {
                  log('Location tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
