import 'package:flexi_work/app/modules/vendor/vendor_profile/views/vendor_about_us_view.dart';
import 'package:flexi_work/app/modules/vendor/vendor_profile/views/vendor_edit_profile_view.dart';
import 'package:flexi_work/app/modules/vendor/vendor_profile/views/vendor_policies_view.dart';
import 'package:flexi_work/app/modules/vendor/vendor_profile/views/vendor_settings_view.dart';
import 'package:flexi_work/app/modules/vendor/vendor_profile/views/vendor_support_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../../../auth/login/views/login_view.dart';
import '../controllers/vendor_profile_controller.dart';

class VendorProfileView extends GetView<VendorProfileController> {
  const VendorProfileView({super.key});

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
              'lukas.wagner@gmail.com',
              style: h6.copyWith(
                color: AppColors.black100,
              ),
            ),
            sh20,
            CustomListTile(
              onTap: () {
                Get.to(() => VendorEditProfileView());
              },
              leadingImage: AppImages.account,
              title: 'Edit Profile',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(() => VendorSettingsView());
              },
              leadingImage: AppImages.myOrder,
              title: 'Settings',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  'Support',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
              ),
            ),
            sh8,
            CustomListTile(
              onTap: () {
                Get.to(() => VendorSupportView());
              },
              leadingImage: AppImages.support,
              title: 'Support',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(() => VendorPoliciesView());
              },
              leadingImage: AppImages.policy,
              title: 'Policies',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(() => VendorAboutUsView());
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
                  Get.offAll(() => LoginView());
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
