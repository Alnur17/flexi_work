import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_product_card.dart';
import '../../../../data/dummydata.dart';
import '../../store_profile/views/store_profile_view.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final controller = Get.put(ProductDetailsController());
  final PageController _pageController = PageController();

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
        title: const Text('Product Details'),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              AppImages.share,
              scale: 4,
            ),
          ),
          sw20
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh16,
            Obx(
              () => SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      children: controller.images
                          .map((image) => ProductImageCard(
                                imagePath: image,
                              ))
                          .toList(),
                    ),
                    // Smooth Page Indicator inside the container
                    Positioned(
                      top: 12,
                      left: 30,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: controller.images.length,
                          effect: WormEffect(
                            activeDotColor: AppColors.textColorBlue,
                            dotColor: AppColors.white,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          '\$89.99',
                          style: h5.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 30,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          '-30%',
                          style: h6.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sh16,
                  Text(
                    'SonicPulse Pro Over-Ear Headphones',
                    style: h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                  sh12,
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '4.5',
                            style: h5.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      sw8,
                      Container(
                        width: 3,
                        height: 25, // Set the height for the divider
                        color: AppColors.grey,
                      ),
                      sw8,
                      Text(
                        '1k Reviews',
                        style: h5.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      CustomButton(
                        height: 40,
                        width: 150,
                        onPressed: () {},
                        text: 'Message',
                        backgroundColor: AppColors.green,
                        imageAssetPath: AppImages.chatTwo,
                        textStyle: h5.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  sh12,
                  Text(
                    'Product Details',
                    style: h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                  sh8,
                  Text(
                    'Brand: SonicPulse',
                    style: h5,
                  ),
                  sh8,
                  Text(
                    'Category: Electronics - Audio Accessories',
                    style: h5,
                  ),
                  sh8,
                  Text(
                    'Availability: In Stock',
                    style: h5,
                  ),
                  sh8,
                  Text(
                    'Product Features:',
                    style: h5,
                  ),
                  sh8,
                  Obx(
                    () => Column(
                      children: List.generate(
                        controller.isExpanded.value
                            ? controller.productDetails.length
                            : 3, // Show only 3 items when collapsed
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}.',
                                style: h5,
                              ),
                              sw8,
                              Expanded(
                                child: Text(
                                  controller.productDetails[index],
                                  style: h5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  sh8,
                  Obx(
                    () => CustomButton(
                      text: controller.isExpanded.value
                          ? 'See Less'
                          : 'See more..',
                      onPressed: () {
                        controller.isExpanded.value =
                            !controller.isExpanded.value;
                      },
                      width: 130,
                      height: 30,
                      backgroundColor: AppColors.green,
                      textStyle: h5.copyWith(color: AppColors.white),
                      imageAssetPath: AppImages.arrowDown,
                      imageAssetPathColor: AppColors.white,
                    ),
                  ),
                  sh12,
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.blue,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Warranty Policy',
                              style: h5.copyWith(color: AppColors.white),
                            ),
                            Image.asset(
                              AppImages.arrowRightSmall,
                              scale: 4,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Return & Refund Policy',
                              style: h5.copyWith(color: AppColors.white),
                            ),
                            Image.asset(
                              AppImages.arrowRightSmall,
                              scale: 4,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Replacement Policy',
                              style: h5.copyWith(color: AppColors.white),
                            ),
                            Image.asset(
                              AppImages.arrowRightSmall,
                              scale: 4,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  sh20,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(AppImages.storeImage),
                          ),
                          sw8,
                          Text(
                            'UrbanStyle Co',
                            style: h2,
                          ),
                        ],
                      ),
                      sh12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '123 Main Street, Berlin, Germany, 10115',
                            style: h5,
                          ),
                          sw8,
                          Image.asset(
                            AppImages.locationFilled,
                            scale: 4,
                          ),
                        ],
                      ),
                      sh12,
                      TextButton(
                        onPressed: () {
                          Get.to(() => StoreProfileView());
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            fixedSize: Size(150, 45)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Visit Store',
                              style: h4.copyWith(color: AppColors.white),
                            ),
                            Image.asset(
                              AppImages.arrowRightNormal,
                              scale: 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  sh12,
                  Text(
                    'You might also like',
                    style: h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            sh8,
            SizedBox(
              height: 155,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
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
                      log('${product['productName']} bookmark tapped');
                    },
                  );
                },
              ),
            ),
            sh20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Customer Reviews',
                    style: h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '1k Reviews',
                    style: h6.copyWith(fontWeight: FontWeight.bold,color: AppColors.green),
                  ),
                  Image.asset(
                    AppImages.arrowRightSmall,
                    scale: 4,
                    color: AppColors.green,
                  ),
                ],
              ),
            ),
            sh8,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.green)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Emily R',
                        style: h5.copyWith(
                          fontWeight: FontWeight.bold,
                        ),),
                      sw8,
                      Image.asset(
                        AppImages.star,
                        scale: 4,
                      )
                    ],
                  ),
                  sh5,
                  Text(
                    'Incredible Sound and Comfort!',
                    style: h5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sh8,
                  Text(
                    'The noise cancellation is top-notch! I recently took a long flight, and this headset completely drowned out the engine noise. The battery lasted the entire trip, and the foldable design made it easy to pack. A must-have for travelers!',
                    style: h6,
                  ),
                  sh5,
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            AppImages.profileImageTwo,
                            scale: 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      sw8,
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            AppImages.profileImageTwo,
                            scale: 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sh8,
                  Text('December 20, 2024')
                ],
              ),
            ),
            sh12,
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.bottomNavbar,
          border: Border(top: BorderSide(color: AppColors.green)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AppImages.storeImage),
                ),
                Text('Store'),
              ],
            ),
            Spacer(),
            CustomButton(
              width: 110,
              text: 'Buy Now',
              onPressed: () {},
              gradientColors: AppColors.gradientColor,
            ),
            sw12,
            CustomButton(
              width: 130,
              text: 'Add to Cart',
              onPressed: () {
                log('Add to Cart tapped');
              },
              borderColor: AppColors.blue,
              textColor: AppColors.blue,
              backgroundColor: AppColors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImageCard extends StatelessWidget {
  final String imagePath;

  const ProductImageCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.bottomNavbar,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
