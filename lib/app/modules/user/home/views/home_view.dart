import 'dart:developer';

import 'package:flexi_work/app/modules/user/home/views/support_view.dart';
import 'package:flexi_work/app/modules/user/tasker_profile/views/tasker_profile_view.dart';
import 'package:flexi_work/common/app_color/app_colors.dart';
import 'package:flexi_work/common/app_images/app_images.dart';
import 'package:flexi_work/common/helper/worker_card.dart';
import 'package:flexi_work/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/explore_and_shop_list.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_product_card.dart';
import '../../../../../common/widgets/custom_row_header.dart';
import '../../../../data/dummydata.dart';
import '../../my_search/views/my_search_view.dart';
import '../../product_details/views/product_details_view.dart';

class DummyWorkerData {
  static final List<Map<String, dynamic>> dummyWorkers = [
    {
      'name': 'John Doe',
      'occupation': 'Carpenter',
      'rating': 4.7,
      'hourlyRate': 25.0,
      'imageUrl': AppImages.profileImageTwo,
    },
    {
      'name': 'Jane Smith',
      'occupation': 'Plumber',
      'rating': 4.3,
      'hourlyRate': 22.0,
      'imageUrl': AppImages.profileImageTwo,
    },
    {
      'name': 'Mike Johnson',
      'occupation': 'Electrician',
      'rating': 4.9,
      'hourlyRate': 30.0,
      'imageUrl': AppImages.profileImageTwo,
    },
  ];
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RxBool isProductsSelected = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: GestureDetector(
          onTap: () {
            Get.to(() => MySearchView());
          },
          child: Container(
            height: 48,
            margin: EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
                Image.asset(AppImages.filter, scale: 4),
              ],
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(()=> SupportView());
            },
            child: Image.asset(
              AppImages.supportSmall,
              scale: 4,
            ),
          ),
          sw12,
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
              child: Obx(
                () => Container(
                  height: 48,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.green, width: 1),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isProductsSelected.value = true;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isProductsSelected.value
                                  ? AppColors.orange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Products',
                                style: h5.copyWith(
                                  color: isProductsSelected.value
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isProductsSelected.value = false;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isProductsSelected.value
                                  ? AppColors.orange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Worker',
                                style: h5.copyWith(
                                  color: !isProductsSelected.value
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sh12,
            Obx(
              () => isProductsSelected.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomRowHeader(
                            title: 'Categories',
                            subtitle: Text(
                              'See All..',
                              style: h5.copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ),
                        sh12,
                        SizedBox(
                          height: 100,
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
                                  imagePath: AppImages.babyDress,
                                  label: 'Fashion & \nApparel',
                                ),
                              );
                            },
                          ),
                        ),
                        sh16,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomRowHeader(
                            title: 'Special Offers',
                            titleStyle: h4.copyWith(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold),
                            subtitle: Text(
                              'See All..',
                              style: h5.copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ),
                        sh12,
                        SizedBox(
                          height: 155,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              final product = DummyData.dummyProducts[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: index == 5 - 1 ? 20 : 8,
                                  left: index == 0 ? 20 : 0,
                                ),
                                child: CustomProductCard(
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
                                ),
                              );
                            },
                          ),
                        ),
                        sh16,
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Shop Essentials',
                            style: h4.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        sh12,
                        GridView.builder(
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 96),
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
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
                                log('${product['productName']} bookmark tapped');
                              },
                            );
                          },
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Find Trusted Professionals',
                            style: h4.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        sh12,
                        GridView.builder(
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 96),
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: DummyWorkerData.dummyWorkers.length,
                          itemBuilder: (context, index) {
                            final worker = DummyWorkerData.dummyWorkers[index];
                            return WorkerCard(
                              name: worker['name'],
                              occupation: worker['occupation'],
                              rating: worker['rating'],
                              hourlyRate: worker['hourlyRate'],
                              imageUrl: worker['imageUrl'],
                              onTap: () {
                                Get.to(() => TaskerProfileView());
                              },
                            );
                          },
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
