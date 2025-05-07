import 'package:get/get.dart';

import '../controllers/service_provider_home_controller.dart';

class ServiceProviderHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderHomeController>(
      () => ServiceProviderHomeController(),
    );
  }
}
