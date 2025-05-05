import 'package:get/get.dart';

import '../controllers/store_profile_controller.dart';

class StoreProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreProfileController>(
      () => StoreProfileController(),
    );
  }
}
