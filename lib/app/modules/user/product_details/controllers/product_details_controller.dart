import 'package:get/get.dart';

import '../../../../../common/app_images/app_images.dart';

class ProductDetailsController extends GetxController {
  var productDetails = [
    "Premium Sound Quality: Experience rich bass and crystal-clear treble for immersive audio.",
    "Comfortable Design: Over-ear cushioned ear cups for long-lasting comfort.",
    "Wireless Connectivity: Bluetooth 5.0 with a range of up to 30 feet.",
    "Built-in Microphone: High-quality mic for hands-free calls and voice commands.",
    "Battery Life: Up to 30 hours of playtime on a single charge.",
    "Noise-Canceling Technology: Active noise-canceling feature to block out unwanted sounds.",
    "Compact Foldable Design: Easily fold and store in the provided case."
  ].obs;

  var isExpanded = false.obs;

  var images = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the image list (could also be from an API or other source)
    images.addAll([
      AppImages.productImage,
      AppImages.productImage,
      AppImages.productImage,
    ]);
  }
}
