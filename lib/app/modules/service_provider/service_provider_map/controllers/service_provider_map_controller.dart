import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceProviderMapController extends GetxController {
  var startLatLng = const LatLng(37.7749, -122.4194).obs;
  var endLatLng = const LatLng(37.7833, -122.4058).obs;
  var providerName = 'Lukas Wegner'.obs;
  var distance = 1.2.obs;
  var arrivalTime = 8.obs;

  void updateRoute(LatLng newStart, LatLng newEnd) {
    startLatLng.value = newStart;
    endLatLng.value = newEnd;
  }

  void fetchProviderData() {
    providerName.value = 'Lukas Wegner';
    distance.value = 1.2;
    arrivalTime.value = 8;
  }

  @override
  void onInit() {
    super.onInit();
    fetchProviderData();
  }
}