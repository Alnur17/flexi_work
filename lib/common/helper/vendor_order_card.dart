import 'package:flexi_work/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class VendorOrderCard extends StatelessWidget {
  final String image;
  final String name;
  final String productColor;
  final String orderStatus;

  const VendorOrderCard({
    super.key,
    required this.image,
    required this.name,
    required this.productColor,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            sw16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Order Summary',
                          style: h3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.orange,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          orderStatus,
                          style: h5.copyWith(color: AppColors.orange),
                        ),
                      ),
                    ],
                  ),
                  sh5,
                  Text(
                    name,
                    style: h4,
                  ),
                  sh5,
                  Text(
                    'Color: $productColor',
                    style: h6.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
