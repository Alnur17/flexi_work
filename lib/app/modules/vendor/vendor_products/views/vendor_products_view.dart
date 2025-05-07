import 'package:flexi_work/app/modules/vendor/vendor_products/views/vendor_add_products_view.dart';
import 'package:flexi_work/common/widgets/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/vendor_products_controller.dart';
import '../../../../../common/helper/vendor_trending_card.dart';

class VendorProductsView extends StatefulWidget {
  const VendorProductsView({super.key});

  @override
  State<VendorProductsView> createState() => _VendorProductsViewState();
}

class _VendorProductsViewState extends State<VendorProductsView> {
  final VendorProductsController vendorProductsController =
      Get.put(VendorProductsController());

  // Define the category data
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Paint & Coatings',
      'image': AppImages.babyDress,
      'color': Colors.yellow[100],
    },
    {
      'title': 'Power Tools',
      'image': AppImages.babyDress,
      'color': Colors.orange[100],
    },
    {
      'title': 'Hand Tools',
      'image': AppImages.babyDress,
      'color': Colors.blue[100],
    },
    {
      'title': 'Safety & Protectio',
      'image': AppImages.babyDress,
      'color': Colors.green[100],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Products',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchFiled(
              onChanged: (value) {},
            ),
          ),
          sh12,
          // Category Section using ListView.builder
          SizedBox(
            height: 50, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                    right: index == categories.length - 1 ? 20 : 8,
                  ),
                  child: _buildCategoryButton(
                    category['title'],
                    category['image'],
                    category['color'],
                  ),
                );
              },
            ),
          ),
          sh16,
          GestureDetector(
            onTap: () {
              Get.to(() => VendorAddProductsView());
            },
            child: Container(
              height: 40,
              width: 140,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: AppColors.gradientColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(), color: AppColors.white),
                      child: Image.asset(
                        AppImages.add,
                        scale: 4,
                      )),
                  Text(
                    'Add Products',
                    style: h5.copyWith(color: AppColors.white),
                  ),
                  sw5,
                ],
              ),
            ),
          ),
          sh16,
          Expanded(
            child: Obx(() => GridView.builder(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                  itemCount: vendorProductsController.currentProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 170,
                  ),
                  itemBuilder: (context, index) {
                    final product =
                        vendorProductsController.currentProducts[index];
                    return VendorTrendingCard(
                      imagePath: product['imagePath']!,
                      name: product['name']!,
                      price: product['price']!,
                      onTap: () {},
                      onEditTap: () {},
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title, String image, Color? color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            scale: 4,
          ),
          sw8,
          Text(title, style: h5),
        ],
      ),
    );
  }
}
