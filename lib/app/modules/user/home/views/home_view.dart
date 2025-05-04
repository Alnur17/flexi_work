import 'dart:developer';

import 'package:flexi_work/common/app_color/app_colors.dart';
import 'package:flexi_work/common/app_images/app_images.dart';
import 'package:flexi_work/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/explore_and_shop_list.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_product_card.dart';
import '../../../../../common/widgets/custom_row_header.dart';
import '../../../../../common/widgets/custom_store_card.dart';
import '../../../../data/dummydata.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: GestureDetector(
          onTap: () {
           // Get.to(() => SearchView());
          },
          child: Container(
            height: 48,
            margin: EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              //color: AppColors.white,
              border: Border.all(color: AppColors.blue),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppImages.search,
                  scale: 4,
                ),
                sw12,
                Text(
                  'Search...',
                  style: h5,
                ),
                Spacer(),
                Image.asset(AppImages.filter,scale: 4,),
              ],
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.blue),
              ),
              child: Image.asset(
                AppImages.notification,
                scale: 4,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.bottomNavbar,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        AppImages.homePromo,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23/12 - 1/2',
                            style: h5.copyWith(color: AppColors.white),
                          ),
                          sh5,
                          Text(
                            'One Sale ManyThings',
                            style: h3.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          sh5,
                          Text(
                            'The most biggest sale event in this year  you dont want to miss',
                            style: h5.copyWith(color: AppColors.white),
                          ),
                          Spacer(),
                          CustomButton(
                            text: 'Discover More',
                            onPressed: () {},
                            height: 30,
                            width: 150,
                            backgroundColor: AppColors.white,
                            textStyle: h5.copyWith(
                              color: AppColors.orangeLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomRowHeader(
                title: 'Stores Near You',
                subtitle: Text(
                  'See More..',
                  style: h5.copyWith(
                      color: AppColors.textColorBlue,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
            ),
            sh12,
            // section 4
            SizedBox(
              height: 265,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 5 - 1 ? 20 : 8,
                      left: index == 0 ? 20 : 0,
                    ),
                    child: CustomStoreCard(
                      imageUrl: AppImages.storeImage,
                      storeName: 'BrotHaus',
                      distance: '1.2',
                      rating: 4.5,
                    ),
                  );
                },
              ),
            ),
            sh16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomRowHeader(
                title: 'Explore & Shop',
                subtitle: Text(
                  'See All..',
                  style: h5.copyWith(
                      color: AppColors.textColorBlue,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
            ),
            sh12,
            SizedBox(
              height: 100,
              // Specify the height for the horizontal ListView
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 10 - 1 ? 20 : 8,
                      left: index == 0 ? 20 : 0,
                    ),
                    child: ExploreAndShopList(
                        imagePath: AppImages.storeImageTwo, label: 'Footwear'),
                  );
                },
              ),
            ),
            sh16,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'For You',
                style: h4.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            sh12,
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              itemCount: DummyData.dummyProducts.length,
              itemBuilder: (context, index) {
                final product = DummyData.dummyProducts[index];
                return CustomProductCard(
                  imageUrl: product['imageUrl'],
                  productName: product['productName'],
                  currentPrice: product['currentPrice'],
                  originalPrice: product['originalPrice'],
                  rating: product['rating'],
                  onCardTap: () {
                    //Get.to(() => ProductDetailsView());
                  },
                  onBookmarkTap: () {
                    log('${product['productName']} bookmark tapped');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
