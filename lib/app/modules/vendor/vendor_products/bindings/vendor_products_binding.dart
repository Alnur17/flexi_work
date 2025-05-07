import 'package:get/get.dart';

import '../controllers/vendor_products_controller.dart';

class VendorProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorProductsController>(
      () => VendorProductsController(),
    );
  }
}
