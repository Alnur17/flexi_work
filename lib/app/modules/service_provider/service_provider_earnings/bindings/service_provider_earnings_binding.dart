import 'package:get/get.dart';

import '../controllers/service_provider_earnings_controller.dart';

class ServiceProviderEarningsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderEarningsController>(
      () => ServiceProviderEarningsController(),
    );
  }
}
