import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/service_provider_home_controller.dart';

class ServiceProviderHomeView extends GetView<ServiceProviderHomeController> {
  const ServiceProviderHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServiceProviderHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ServiceProviderHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
