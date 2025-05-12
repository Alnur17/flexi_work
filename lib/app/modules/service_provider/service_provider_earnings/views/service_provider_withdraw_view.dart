import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';

class ServiceProviderWithdrawView extends GetView {
  const ServiceProviderWithdrawView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Success',
          style: titleStyle.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue[100]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.payment,
                    scale: 4,
                  ),
                  sh20,
                  Text(
                    'Withdraw Successful',
                    style: h3.copyWith(fontSize: 20),
                  ),
                  sh5,
                  Text(
                    'Your top up has been successful done',
                    style: h5,
                  ),
                  sh20,
                  Text(
                    'Total Withdraw',
                    style: h5,
                  ),
                  sh5,
                  Text(
                    '\$200.00',
                    style: h3.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            sh30,
            CustomButton(
              text: 'Close',
              onPressed: () {
                Get.back();
              },
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }
}
