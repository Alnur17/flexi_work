import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyOrderView extends GetView {
  const MyOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyOrderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
