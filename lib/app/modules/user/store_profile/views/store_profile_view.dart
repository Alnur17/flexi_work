import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_product_card.dart';
import '../../../../data/dummydata.dart';
import '../../product_details/views/product_details_view.dart';
import '../controllers/store_profile_controller.dart';

class StoreProfileView extends GetView<StoreProfileController> {
  const StoreProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.storeColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.storeColor,
          title: const Text(
            'Store Profile',
            style: TextStyle(color: AppColors.white),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                AppImages.back,
                scale: 4,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(AppImages.storeImage),
                  ),
                  sw8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Toy Hub',
                          style: h1.copyWith(
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                        ),
                        sh5,
                        Row(
                          children: [
                            Image.asset(
                              AppImages.locationFilled,
                              scale: 4,
                              color: AppColors.white,
                            ),
                            Expanded(
                              child: Text(
                                '123 Main Street, Berlin, Germany, 10115',
                                style: h7.copyWith(color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                        sh8,
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            sw5,
                            Text(
                              '4.5',
                              style: h5.copyWith(color: AppColors.white),
                            ),
                            sw8,
                            Container(
                              width: 2,
                              height: 20,
                              color: AppColors.white,
                            ),
                            sw8,
                            Text(
                              '1k Reviews',
                              style: h5.copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                        sh8,
                        CustomButton(
                          text: 'Message',
                          onPressed: () {},
                          width: 110,
                          height: 35,
                          textStyle: h6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                          imageAssetPath: AppImages.chatTwo,
                          gradientColors: AppColors.gradientColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // sh12,
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       const Icon(
            //         Icons.star,
            //         color: Colors.orange,
            //         size: 16,
            //       ),
            //       sw5,
            //       Text('4.5', style: h5),
            //       sw8,
            //       Container(
            //         width: 2,
            //         height: 20, // Set the height for the divider
            //         color: AppColors.grey,
            //       ),
            //       sw8,
            //       Text('1k Reviews', style: h5),
            //     ],
            //   ),
            // ),
            sh20,
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TabBar(
                labelStyle: h4.copyWith(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'Products'),
                  //Tab(text: 'Reviews'),
                  Tab(text: 'About'),
                ],
                labelColor: AppColors.orange,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.orange,
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: AppColors.white,
                    child: Column(
                      children: [
                        sh20,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items (120)'),
                              sw12,
                              Image.asset(
                                AppImages.search,
                                scale: 4,
                               // color: AppColors.textColorBlue,
                              ),
                            ],
                          ),
                        ),
                        sh20,
                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 1,
                            ),
                            itemCount: DummyData.dummyProducts.length,
                            itemBuilder: (context, index) {
                              final product = DummyData.dummyProducts[index];
                              return CustomProductCard(
                                imageUrl: product['imageUrl'],
                                productName: product['productName'],
                                price: product['price'],
                                discount: product['discount'],
                                rating: product['rating'],
                                onCardTap: () {
                                  Get.to(() => ProductDetailsView());
                                },
                                onBookmarkTap: () {
                                  log('bookmark tapped');
                                },
                              );
                            },
                          ),
                        ),
                        sh20,
                      ],
                    ),
                  ),
                  // Container(
                  //   color: AppColors.white,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //     child: SingleChildScrollView(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           sh16,
                  //           Row(
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   Text(
                  //                     '4.5 ⭐',
                  //                     style: h2,
                  //                   ),
                  //                   sh8,
                  //                   Text(
                  //                     '5,922 Reviews',
                  //                     style: h5.copyWith(color: AppColors.grey),
                  //                   ),
                  //                 ],
                  //               ),
                  //               sw40,
                  //               Expanded(
                  //                 child: Column(
                  //                   children: [
                  //                     for (int i = 5; i > 0; i--)
                  //                       Row(
                  //                         children: [
                  //                           Text('$i★',
                  //                               style: TextStyle(fontSize: 16)),
                  //                           SizedBox(width: 8),
                  //                           Expanded(
                  //                             child: LinearProgressIndicator(
                  //                               minHeight: 6,
                  //                               borderRadius:
                  //                                   BorderRadius.circular(6),
                  //                               value: i == 5
                  //                                   ? 0.8
                  //                                   : i == 4
                  //                                       ? 0.4
                  //                                       : i == 3
                  //                                           ? 0.6
                  //                                           : i == 2
                  //                                               ? 0.2
                  //                                               : 0.1,
                  //                               backgroundColor:
                  //                                   Colors.grey[300],
                  //                               valueColor:
                  //                                   AlwaysStoppedAnimation<
                  //                                       Color>(
                  //                                 AppColors.textColorBlue,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           sh20,
                  //           CustomButton(
                  //             text: 'Write a Review',
                  //             onPressed: () {
                  //               //Get.to(()=> WriteReviewView());
                  //             },
                  //             borderColor: AppColors.grey,
                  //             backgroundColor: AppColors.transparent,
                  //             textColor: AppColors.black100,
                  //           ),
                  //           sh20,
                  //           ListView.builder(
                  //             shrinkWrap: true,
                  //             primary: false,
                  //             itemCount: DummyData.reviewData.length,
                  //             itemBuilder: (context, index) {
                  //               final data = DummyData.reviewData[index];
                  //               return GestureDetector(
                  //                 onTap: () {
                  //                   // Get.to(() => );
                  //                 },
                  //                 child: Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     sh12,
                  //                     Row(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         CircleAvatar(
                  //                           radius: 30,
                  //                           backgroundImage:
                  //                               NetworkImage(data['imageUrl']),
                  //                         ),
                  //                         sw16,
                  //                         Column(
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                           children: [
                  //                             Text(data['name'], style: h4),
                  //                             sh8,
                  //                             Text(data['date'], style: h6),
                  //                           ],
                  //                         ),
                  //                         Spacer(),
                  //                         Text('⭐⭐⭐⭐⭐'),
                  //                       ],
                  //                     ),
                  //                     sh8,
                  //                     Text(
                  //                       data['message'],
                  //                       style: h6,
                  //                       maxLines: 3,
                  //                       overflow: TextOverflow.ellipsis,
                  //                     ),
                  //                     sh8,
                  //                     Divider(),
                  //                   ],
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sh20,
                            Row(
                              children: [
                                Text(
                                  'Store Name: ',
                                  style: h5,
                                ),
                                Text(
                                  'Toy Hub',
                                  style:
                                      h5.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Owner: ',
                                  style: h5,
                                ),
                                Text(
                                  'Michael Fischer',
                                  style:
                                      h5.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Seller Rating: ',
                                  style: h5,
                                ),
                                Text(
                                  '4.8/5',
                                  style:
                                      h5.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            sh12,
                            Text(
                              'Store Description:',
                              style: h5.copyWith(fontWeight: FontWeight.bold),
                            ),
                            sh8,
                            Text(
                              'Our store offers a wide range of high-quality toys, from educational games to action figures and creative building sets. Whether you\'re looking for the perfect gift or a toy to inspire your child\'s creativity, we have something for everyone. Visit us for a magical shopping experience!',
                              style: h6,
                            ),
                            sh12,
                            Text(
                              'Location:',
                              style: h5.copyWith(fontWeight: FontWeight.bold),
                            ),
                            sh8,
                            Text(
                              '123 Main Street, Berlin, Germany, 10115',
                              style: h5,
                            ),
                            sh12,
                            Text(
                              'Contact Information:',
                              style: h5.copyWith(fontWeight: FontWeight.bold),
                            ),
                            sh8,
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.call,
                                  scale: 4,
                                ),
                                sw8,
                                Text('+49 1523 456 7890'),
                              ],
                            ),
                            sh5,
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.mail,
                                  scale: 4,
                                ),
                                sw8,
                                Text('support@techhubelectronics.com'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
