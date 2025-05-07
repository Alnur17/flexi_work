import 'dart:developer';

import 'package:flexi_work/app/modules/vendor/vendor_chat/views/vendor_message_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_circular_container.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class VendorChatView extends StatefulWidget {
  const VendorChatView({super.key});

  @override
  State<VendorChatView> createState() => _VendorChatViewState();
}

class _VendorChatViewState extends State<VendorChatView> {
  bool showChats = true;

  @override
  Widget build(BuildContext context) {
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
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              preIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AppImages.search,
                  scale: 4,
                ),
              ),
              hintText: 'Search here..',
              borderRadius: 30,
            ),
          ),
          Expanded(
            child: ChatList(),
          ),
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => VendorMessageView());
            log('message index is $index');
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 20,
              bottom: index == 10-1 ? 90 : 8,
              right: 20,
              top: index == 0 ? 16 : 0,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.bottomNavbar,
                border: Border.all(color: AppColors.silver)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(AppImages.profileImageTwo),
              ),
              title: Text(
                'Lukas Wagner',
                style: h4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black100,
                ),
              ),
              subtitle: Text(
                'Can we assist you with your query about headphones?',
                style: h6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Container(
                padding: EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColors.green,
                ),
                child: Text(
                  '',
                  style: h6.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

