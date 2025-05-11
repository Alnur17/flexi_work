import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ServiceProviderWithdrawView extends GetView {
  const ServiceProviderWithdrawView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServiceProviderWithdrawView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ServiceProviderWithdrawView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
