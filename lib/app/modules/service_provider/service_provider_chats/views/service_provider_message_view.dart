import 'package:flexi_work/app/modules/service_provider/service_provider_chats/controllers/service_provider_chats_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_circular_container.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class ServiceProviderMessageView extends GetView {
  const ServiceProviderMessageView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    final ServiceProviderChatsController serviceProviderChatsController = Get.put(ServiceProviderChatsController());
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leading: CustomCircularContainer(
          imagePath: AppImages.back,
          onTap: () {
            Get.back();
          },
          padding: 4,
        ),
        titleSpacing: 8,
        title: Text(
          'Service Provider',
          style: TextStyle(color: Colors.black),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomCircularContainer(
              imagePath: AppImages.alert,
              backgroundColor: AppColors.silver,
              onTap: () {
                Get.back();
              },
            ),
          ),
          sw12,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: serviceProviderChatsController.messages.length,
                itemBuilder: (context, index) {
                  final message = serviceProviderChatsController.messages[index];
                  if (message.isSent) {
                    return _buildSentMessage(
                      message: message.text,
                      time: message.time,
                    );
                  } else {
                    return _buildReceivedMessage(
                      message: message.text,
                      time: message.time,
                    );
                  }
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(
      {required String message, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        sh5,
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 8, right: 80),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Text(
            message,
            style: h5.copyWith(color: AppColors.black),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSentMessage({required String message, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        sh5,
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 8, left: 80),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Text(
            message,
            style: h5.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    final TextEditingController textController = TextEditingController();
    final ServiceProviderChatsController serviceProviderChatsController = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border(
        //   top: BorderSide(color: Colors.grey[300]!),
        // ),
      ),
      child: Row(
        children: [
          Image.asset(
            AppImages.attachFile,
            scale: 4,
          ),
          sw12,
          Expanded(
            child: CustomTextField(
              controller: textController,
              hintText: 'Message',
              borderRadius: 30,
              containerColor: AppColors.bottomNavbar,
            ),
          ),
          sw12,
          GestureDetector(
            onTap: () {
              if (textController.text.trim().isNotEmpty) {
                serviceProviderChatsController.addMessage(textController.text.trim(), true);
                textController.clear();

                // Simulating a bot response
                Future.delayed(
                  Duration(seconds: 1),
                      () {
                    serviceProviderChatsController.addMessage(
                      'This is an auto-reply from Service Provider!',
                      false,
                    );
                  },
                );
              }
            },
            child: Image.asset(
              AppImages.send,
              scale: 4,
            ),
          ),
        ],
      ),
    );
  }
}
