import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_row_header.dart';

class CheckOutView extends GetView {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: const Text('Check Out'),
        //centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sultan Vai',
                        style: h5.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '+49 17612345678',
                        style: h6.copyWith(
                          color: AppColors.black100,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.edit,
                    scale: 4,
                  ),
                ],
              ),
              sh16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green[50],
                        ),
                        child: Text(
                          'Home',
                          style: h5,
                        ),
                      ),
                      sh5,
                      Row(
                        children: [
                          Text(
                            '123 Main Street, Berlin, Germany, 10115',
                            style: h6.copyWith(
                              color: AppColors.black100,
                            ),
                          ),
                          sw8,
                          Image.asset(
                            AppImages.locationFilled,
                            scale: 4,
                          )
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.arrowRightSmall,
                    scale: 4,
                  )
                ],
              ),
              // sh16,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(16),
              //             color: Colors.green[50],
              //           ),
              //           child: Text(
              //             'Pick up point',
              //             style: h5,
              //           ),
              //         ),
              //         sh5,
              //         Row(
              //           children: [
              //             Text(
              //               '123 Main Street, Berlin, Germany, 10115',
              //               style: h6.copyWith(
              //                 color: AppColors.black100,
              //               ),
              //             ),
              //             sw8,
              //             Image.asset(
              //               AppImages.locationFilled,
              //               scale: 4,
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //     Image.asset(
              //       AppImages.arrowRightSmall,
              //       scale: 4,
              //     )
              //   ],
              // ),
              sh12,
              CustomRowHeader(
                title: 'Delivery Option',
                subtitle: Text(
                  'All option..',
                  style: h5.copyWith(
                      color: AppColors.green, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              sh12,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.silver),
                    color: AppColors.bottomNavbar),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Standard Delivery',
                            style: h5.copyWith(fontWeight: FontWeight.bold),
                          ),
                          sh8,
                          Text(
                            'By 30 Dec - 3 jan',
                            style: h5,
                          )
                        ],
                      ),
                      Text(
                        '\$3.99',
                        style: h4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              sh12,
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.green),
                  color: AppColors.bottomNavbar,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.productImage,
                        scale: 4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    sw12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SonicPulse Pro Over-Ear Headphones',
                            style: h4.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Brand: SonicPulse',
                            style: h5.copyWith(color: AppColors.grey),
                          ),
                          Text(
                            'Colour: Matte black',
                            style: h5.copyWith(color: AppColors.grey),
                          ),
                          sh8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  AppImages.minusRound,
                                  scale: 4,
                                ),
                              ),
                              sw12,
                              Text(
                                '1',
                                style: h4.copyWith(fontWeight: FontWeight.bold),
                              ),
                              sw12,
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  AppImages.addRound,
                                  scale: 4,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$89.99',
                                style: h4.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // sh12,
              // CustomTextField(
              //   hintText: 'Discount code',
              //   height: 54,
              //   containerColor: AppColors.bottomNavbar,
              // ),
              sh12,
              Text(
                'Price Details',
                style: h4.copyWith(fontWeight: FontWeight.bold),
              ),
              sh8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price (1 Item)',
                    style: h5,
                  ),
                  Text(
                    '\$89.99',
                    style: h5,
                  ),
                ],
              ),
              sh8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Fee',
                    style: h5,
                  ),
                  Text(
                    '\$3.99',
                    style: h5,
                  ),
                ],
              ),
              sh8,
              Divider(),
              sh8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment:',
                    style: h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$93.98',
                    style: h4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              sh20
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColors.bottomNavbar,
            border: Border(top: BorderSide(color: AppColors.green))),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              width: 150,
              text: 'Place Order',
              onPressed: () {},
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }
}
