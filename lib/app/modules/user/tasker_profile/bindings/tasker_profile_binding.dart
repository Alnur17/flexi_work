import 'package:get/get.dart';

import '../controllers/tasker_profile_controller.dart';

class TaskerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskerProfileController>(
      () => TaskerProfileController(),
    );
  }
}
