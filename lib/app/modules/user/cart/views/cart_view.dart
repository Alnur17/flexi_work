import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/cart_item.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../controllers/cart_controller.dart';
import 'check_out_view.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: const Text('My Cart'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.checkBox,
                  scale: 4,
                ),
                sw12,
                Text(
                  'Select All',
                  style: h6,
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.red)),
                  child: Image.asset(
                    AppImages.delete,
                    scale: 4,
                  ),
                ),
              ],
            ),
            sh12,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CartItem(
                    imagePath: AppImages.productImage,
                    productName: 'SonicPulse Pro Over-Ear Headphones',
                    brand: 'SonicPulse',
                    color: 'Matte black',
                    quantity: 1,
                    totalPrice: '\$89.99',
                    checkBox: AppImages.checkBoxFilled,
                  );
                },
              ),
            ),
            // Row(
            //   children: [
            //     Image.asset(
            //       AppImages.checkBoxFilled,
            //       scale: 4,
            //     ),
            //     Expanded(
            //       child: Card(
            //         color: AppColors.white,
            //         elevation: 4,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(12),
            //                 child: Image.asset(
            //                   AppImages.productImage,
            //                   scale: 4,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               sw8,
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       'SonicPulse Pro Over-Ear Headphones',
            //                       style:
            //                           h5.copyWith(fontWeight: FontWeight.bold),
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                     Text(
            //                       'Brand: SonicPulse,',
            //                       style: h6,
            //                     ),
            //                     sw5,
            //                     Text(
            //                       'Color: Matte black',
            //                       style: h6,
            //                     ),
            //                     Row(
            //                       children: [
            //                         Text(
            //                           'Quantity: 1',
            //                           style: h6.copyWith(
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                         Spacer(),
            //                         Text(
            //                           'Total: \$89.99',
            //                           style: h6.copyWith(
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            sh16,
            // Container(
            //   decoration: BoxDecoration(
            //     color: AppColors.silver,
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Padding(
            //       padding: const EdgeInsets.all(12),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text('Vouchers'),
            //           Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Text(
            //                 'Select',
            //               ),
            //               sw16,
            //               Image.asset(
            //                 AppImages.arrowRightSmall,
            //                 scale: 4,
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // sh16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Subtotal:'),
                        sw12,
                        Text(
                          '\$89.99',
                          style: h5.copyWith(color: AppColors.green),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Shipping Fee:'),
                        sw12,
                        Text(
                          '\$3.99',
                          style: h5.copyWith(color: AppColors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomButton(
                  width: 150,
                  text: 'Check Out',
                  onPressed: () {
                    Get.to(() => CheckOutView());
                  },
                  gradientColors: AppColors.gradientColor,
                ),
              ],
            ),
            sh100,
          ],
        ),
      ),
    );
  }
}
