import 'package:get/get.dart';

import 'package:flexi_work/app/modules/user/chat/controllers/message_controller.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(
      () => MessageController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
