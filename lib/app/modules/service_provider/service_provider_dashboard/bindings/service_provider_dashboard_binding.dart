import 'package:get/get.dart';

import '../controllers/service_provider_dashboard_controller.dart';

class ServiceProviderDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderDashboardController>(
      () => ServiceProviderDashboardController(),
    );
  }
}
