import 'package:flutter/material.dart';

import '../../../../../common/size_box/custom_sizebox.dart';
import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.title,
    required this.address,
    this.isDefault = false,
    required this.onEdit,
    required this.onLocation,
  });

  final String title;
  final String address;
  final bool isDefault;
  final VoidCallback onEdit;
  final VoidCallback onLocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.silver),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onLocation,
              child: Image.asset(
                AppImages.locationRound,
                scale: 4,
              ),
            ),
            sw12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: h4.copyWith(
                      color: AppColors.black100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sh5,
                  Text(
                    address,
                    style: h4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isDefault) ...[
                    sh8,
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.textColorBlue)
                      ),
                      child: Text(
                        'Default shipping address',
                        style: h6.copyWith(color: AppColors.textColorBlue),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            sw12,
            GestureDetector(
              onTap: onEdit,
              child: Image.asset(
                AppImages.editRound,
                scale: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
