import 'package:get/get.dart';

import '../controllers/vendor_earnings_controller.dart';

class VendorEarningsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorEarningsController>(
      () => VendorEarningsController(),
    );
  }
}
