import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_circular_container.dart';

class VendorEarningDetailsView extends GetView {
  const VendorEarningDetailsView({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Earning Details',
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () {
              Get.back();
            },
            padding: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.silver,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      AppImages.profileImage,
                      scale: 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                sw16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jane Cooper',
                      style: h3.copyWith(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'abc@example.com',
                      style: h3.copyWith(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '(515) 555-0115',
                      style: h3.copyWith(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            sh24,
            // Transaction Details Section
            Text(
              'Transaction details :',
              style: h3.copyWith(
                color: AppColors.black,
              ),
            ),
            sh8,
            _buildDetailRow(
              'Transaction ID',
              '12345678',
              AppColors.black,
            ),
            _buildDetailRow(
              'A/C holder name',
              'Robert Fox',
              AppColors.black,
            ),
            _buildDetailRow(
              'A/C number',
              '**** **** **** 456',
             AppColors.black,
            ),
            _buildDetailRow(
              'Received Amount',
              '\$500',
              AppColors.black,
            ),
            const Divider(height: 24),
            _buildDetailRow(
              'Final Amount',
              '\$500',
              isBold: true,
              AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color themeColor,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: h5.copyWith(
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: h5.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
