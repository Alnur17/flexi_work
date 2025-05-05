import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_product_card.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../../data/dummydata.dart';
import '../../product_details/views/product_details_view.dart';
import '../controllers/my_search_controller.dart';

class MySearchView extends StatefulWidget {
  const MySearchView({super.key});

  @override
  State<MySearchView> createState() => _MySearchViewState();
}

class _MySearchViewState extends State<MySearchView> {
  final MySearchController mySearchController = Get.put(MySearchController());

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
        title: CustomTextField(
          preIcon: Image.asset(
            AppImages.search,
            scale: 4,
          ),
          hintText: 'Search here..',
          borderRadius: 30,
          sufIcon: GestureDetector(
            onTap: (){},
            child: Image.asset(
              AppImages.filter,
              scale: 4,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 100,
          //   // Specify the height for the horizontal ListView
          //   child: ListView.builder(
          //     itemCount: 10,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: EdgeInsets.only(
          //           right: index == 10 - 1 ? 16 : 8,
          //           left: index == 0 ? 16 : 0,
          //         ),
          //         child: ExploreAndShopList(
          //             imagePath: AppImages.babyDress, label: 'Baby Dress'),
          //       );
          //     },
          //   ),
          // ),
          sh20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best Match',style: h4.copyWith(color: AppColors.blue),),
                Obx(
                  () => Container(
                    height: 40,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.white,
                        value: mySearchController.selectedValue.value.isEmpty
                            ? null
                            : mySearchController.selectedValue.value,
                        hint: Text('Select',style: h5.copyWith(color: AppColors.blue),),
                        borderRadius: BorderRadius.circular(12),
                        icon: Icon(Icons.arrow_drop_down),
                        iconEnabledColor: AppColors.blue,
                        style: h5.copyWith(color: AppColors.blue),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            mySearchController.updateValue(newValue);
                          }
                        },
                        items: <String>['products', 'workers']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                                value[0].toUpperCase() + value.substring(1)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          sh20,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    log('${product['productName']} bookmark tapped');
                  },
                );
              },
            ),
          ),
          sh20,
        ],
      ),
    );
  }
}


// sw12,
// GestureDetector(
//   onTap: () async {
//     //showFilterModal(context);
//     final filters = await Get.to(
//           () => FilterView(),
//       transition: Transition.rightToLeft,
//       duration: Duration(milliseconds: 500),
//     );
//     if (filters != null) {
//       log('Selected Filters: $filters');
//     }
//   },
//   child: Container(
//     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(16),
//       color: Colors.blue[50],
//     ),
//     child: Row(
//       children: [
//         Image.asset(
//           AppImages.filter,
//           scale: 4,
//         ),
//         sw5,
//         Text(
//           'Filter',
//           style: h5.copyWith(color: AppColors.textColorBlue),
//         ),
//       ],
//     ),
//   ),
// ),
