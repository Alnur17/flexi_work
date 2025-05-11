import 'package:get/get.dart';

import '../controllers/service_provider_chats_controller.dart';

class ServiceProviderChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceProviderChatsController>(
      () => ServiceProviderChatsController(),
    );
  }
}
