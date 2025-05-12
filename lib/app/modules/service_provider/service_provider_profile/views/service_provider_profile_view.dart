import 'package:flexi_work/app/modules/auth/login/views/login_view.dart';
import 'package:flexi_work/app/modules/service_provider/service_provider_profile/views/service_provider_about_us_view.dart';
import 'package:flexi_work/app/modules/service_provider/service_provider_profile/views/service_provider_edit_profile_view.dart';
import 'package:flexi_work/app/modules/service_provider/service_provider_profile/views/service_provider_policies_view.dart';
import 'package:flexi_work/app/modules/service_provider/service_provider_profile/views/service_provider_settings_view.dart';
import 'package:flexi_work/app/modules/service_provider/service_provider_profile/views/service_provider_support_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../controllers/service_provider_profile_controller.dart';

class ServiceProviderProfileView
    extends GetView<ServiceProviderProfileController> {
  const ServiceProviderProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sh20,
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(AppImages.profileImageTwo),
            ),
            sh8,
            Text(
              'Lukas Wagner',
              style: h5.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            sh5,
            Text(
              'Plumber',
              style: h6.copyWith(
                color: AppColors.black100,
              ),
            ),
            sh20,
            CustomListTile(
              onTap: () {
                Get.to(()=> ServiceProviderEditProfileView());
              },
              leadingImage: AppImages.account,
              title: 'Edit Profile',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> ServiceProviderSettingsView());
              },
              leadingImage: AppImages.myOrder,
              title: 'Settings',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> ServiceProviderSupportView());
              },
              leadingImage: AppImages.support,
              title: 'Support',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> ServiceProviderPoliciesView());
              },
              leadingImage: AppImages.policy,
              title: 'Policies',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> ServiceProviderAboutUsView());
              },
              leadingImage: AppImages.aboutUs,
              title: 'About Us',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh16,
            Center(
              child: CustomButton(
                text: 'Log Out',
                onPressed: () {
                  Get.offAll(()=> LoginView());
                },
                imageAssetPath: AppImages.logout,
                width: 150,
                textColor: AppColors.red,
                backgroundColor: Colors.red[50],
              ),
            ),
            sh100,
          ],
        ),
      ),
    );
  }
}
