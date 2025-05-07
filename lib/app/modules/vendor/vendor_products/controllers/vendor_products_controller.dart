import 'package:flexi_work/common/app_images/app_images.dart';
import 'package:get/get.dart';

class VendorProductsController extends GetxController {

  var currentProducts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() {
    currentProducts.assignAll([
      {
        'imagePath': AppImages.productImage,
        'name': 'Nike Air Max',
        'price': '120',
      },{
        'imagePath': AppImages.productImage,
        'name': 'Nike Air Max',
        'price': '120',
      },{
        'imagePath': AppImages.productImage,
        'name': 'Nike Air Max',
        'price': '120',
      },{
        'imagePath': AppImages.productImage,
        'name': 'Nike Air Max',
        'price': '120',
      },{
        'imagePath': AppImages.productImage,
        'name': 'Nike Air Max',
        'price': '120',
      },
      {
        'imagePath': AppImages.productImage,
        'name': 'Adidas Ultraboost',
        'price': '150',
      },
      {
        'imagePath': AppImages.productImage,
        'name': 'Puma RS-X',
        'price': '100',
      },
      {
        'imagePath': AppImages.productImage,
        'name': 'Reebok Classic',
        'price': '\$90',
      },
    ]);
  }
}