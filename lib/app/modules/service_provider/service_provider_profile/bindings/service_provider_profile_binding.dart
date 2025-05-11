import 'package:get/get.dart';

import '../controllers/service_provider_profile_controller.dart';

class ServiceProviderProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderProfileController>(
      () => ServiceProviderProfileController(),
    );
  }
}
