import 'package:flexi_work/common/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/service_provider_map_controller.dart';

class ServiceProviderMapView extends StatefulWidget {
  const ServiceProviderMapView({super.key});

  @override
  State<ServiceProviderMapView> createState() => _ServiceProviderMapViewState();
}

class _ServiceProviderMapViewState extends State<ServiceProviderMapView> {
  late GoogleMapController mapController;
  final ServiceProviderMapController controller = Get.put(ServiceProviderMapController());

  // Default center (can be overridden by controller data)
  static const LatLng _defaultCenter = LatLng(37.7749, -122.4194);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _fitBounds(); // Adjust camera to show both markers
  }

  // Adjust camera to fit both start and end points
  void _fitBounds() {
    final bounds = LatLngBounds(
      southwest: LatLng(
        controller.startLatLng.value.latitude < controller.endLatLng.value.latitude
            ? controller.startLatLng.value.latitude
            : controller.endLatLng.value.latitude,
        controller.startLatLng.value.longitude < controller.endLatLng.value.longitude
            ? controller.startLatLng.value.longitude
            : controller.endLatLng.value.longitude,
      ),
      northeast: LatLng(
        controller.startLatLng.value.latitude > controller.endLatLng.value.latitude
            ? controller.startLatLng.value.latitude
            : controller.endLatLng.value.latitude,
        controller.startLatLng.value.longitude > controller.endLatLng.value.longitude
            ? controller.startLatLng.value.longitude
            : controller.endLatLng.value.longitude,
      ),
    );
    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
                () => GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _defaultCenter,
                zoom: 14.0,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: [
                    controller.startLatLng.value, // Use .value to get LatLng
                    controller.endLatLng.value,   // Use .value to get LatLng
                  ],
                  color: Colors.blue,
                  width: 6,
                ),
              },
              markers: {
                Marker(
                  markerId: const MarkerId('start'),
                  position: controller.startLatLng.value, // Use .value
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                ),
                Marker(
                  markerId: const MarkerId('end'),
                  position: controller.endLatLng.value, // Use .value
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                ),
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(AppImages.profileImageTwo),
                    onBackgroundImageError: (_, __) => const Icon(Icons.error),
                    child: AppImages.profileImageTwo.isEmpty
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.providerName.value, // Use .value for RxString
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${controller.distance.value} km from you, arriving in ${controller.arrivalTime.value} min',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}