import 'package:get/get.dart';

import '../controllers/vendor_chat_controller.dart';

class VendorChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorChatController>(
      () => VendorChatController(),
    );
  }
}
