import 'package:get/get.dart';

import '../controllers/service_provider_task_manager_controller.dart';

class ServiceProviderTaskManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderTaskManagerController>(
      () => ServiceProviderTaskManagerController(),
    );
  }
}
