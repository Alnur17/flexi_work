import 'package:get/get.dart';

class TaskerProfileController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }
}
