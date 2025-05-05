import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  var showShippingDetails = false.obs;

  void toggleShippingDetails() {
    showShippingDetails.value = !showShippingDetails.value;
  }
}
