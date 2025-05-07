import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vendor_profile_controller.dart';

class VendorProfileView extends GetView<VendorProfileController> {
  const VendorProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VendorProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VendorProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
