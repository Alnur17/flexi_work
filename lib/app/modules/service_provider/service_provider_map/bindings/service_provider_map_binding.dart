import 'package:get/get.dart';

import '../controllers/service_provider_map_controller.dart';

class ServiceProviderMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderMapController>(
      () => ServiceProviderMapController(),
    );
  }
}
