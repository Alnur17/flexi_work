import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ServiceProviderEditProfileView extends GetView {
  const ServiceProviderEditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServiceProviderEditProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ServiceProviderEditProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
