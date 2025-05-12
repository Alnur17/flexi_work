import 'dart:developer';

import 'package:flexi_work/common/app_text_style/styles.dart';
import 'package:flexi_work/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../user/tasker_profile/controllers/tasker_profile_controller.dart';

class ServiceProviderEditProfileView extends StatefulWidget {
  const ServiceProviderEditProfileView({super.key});

  @override
  State<ServiceProviderEditProfileView> createState() => _ServiceProviderEditProfileViewState();
}

class _ServiceProviderEditProfileViewState extends State<ServiceProviderEditProfileView> {

  final TaskerProfileController controller = Get.put(TaskerProfileController());

  final List<String> skills = [
    'Pipe Installation & Repair',
    'Leak Detection & Fixing',
    'Drain Cleaning & Unclogging',
    'Water Heater Installation & Maintenance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text('Edit Profile'),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Align(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(

                    radius: 35,
                    backgroundImage:
                    NetworkImage(AppImages.profileImageTwo),
                  ),
                  Positioned(
                    bottom: -5,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        log("Add icon tapped");
                      },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.orange,
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Availability Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Availability', style: TextStyle(fontSize: 16)),
                Switch(value: true, onChanged: (value) {}),
              ],
            ),
            SizedBox(height: 8),
            // From and To Fields
            Text('Date',style: h6,),
            sh8,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'From',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextField( hintText: 'To',),
                ),
              ],
            ),
            sh12,
            Text('Time',style: h6,),
            sh8,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'From',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextField( hintText: 'To',),
                ),
              ],
            ),
            sh16,
            Text('Full Name',style: h6,),
            sh8,
            CustomTextField( ),
            sh16,
            // Job Title
            Text('Job Title',style: h6,),
                        sh8,
            CustomTextField( ),
            sh16,
            Text('Email ',style: h6,),
            sh8,
            CustomTextField( ),
            sh16,
            // Mobile Number
            Text('Mobile Number',style: h6,),
            sh8,
            CustomTextField( ),
            SizedBox(height: 16),
            // Birth Date
            Text('Birth Date',style: h6,),
            sh8,
            CustomTextField( ),
            SizedBox(height: 16),
            // Skills Section
            Obx(
                  () => Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.silver),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills',
                      style: h3.copyWith(
                          fontWeight: FontWeight.w500),
                    ),
                    sh5,
                    ...List.generate(
                      controller.isExpanded.value
                          ? skills.length
                          : 3,
                          (index) => Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: AppColors.black),
                            ),
                            sw8,
                            Text(
                              skills[index],
                              style: h5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.toggleExpand,
                      child: Text(
                        controller.isExpanded.value
                            ? 'Show less'
                            : 'Show more',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sh20,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.silver),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Desired Pay Rate',
                    style: h3.copyWith(
                        fontWeight: FontWeight.w500),
                  ),
                  sh8,
                  Text(
                    '\$22 per hour',
                    style: h5,
                  ),
                ],
              ),
            ),
            sh20,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.silver),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: h3.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sh8,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.locationFilled,
                        scale: 4,
                      ),
                      sw12,
                      Text(
                        'Downtown Los Angeles, CA',
                        style: h5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
