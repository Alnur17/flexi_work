import 'package:get/get.dart';

class MySearchController extends GetxController {
  var selectedValue = ''.obs;

  void updateValue(String value) {
    selectedValue.value = value;
  }
}
