import 'package:flexi_work/app/modules/user/profile/views/help_center_view.dart';
import 'package:flexi_work/app/modules/user/profile/views/policies_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../../../auth/login/views/login_view.dart';
import '../../order_details/views/order_details_view.dart';
import '../controllers/profile_controller.dart';
import 'about_us_view.dart';
import 'account_view.dart';
import 'address_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

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
                Get.to(()=> AccountView());
              },
              leadingImage: AppImages.account,
              title: 'Account',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> OrderDetailsView());
              },
              leadingImage: AppImages.myOrder,
              title: 'My Orders',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> AddressView());
              },
              leadingImage: AppImages.account,
              title: 'Address',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  'Setting',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
              ),
            ),
            sh8,
            CustomListTile(
              onTap: () {},
              leadingImage: AppImages.language,
              title: 'Language',
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
                Get.to(()=> PoliciesView());
              },
              leadingImage: AppImages.policy,
              title: 'Policies',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> HelpCenterView());
              },
              leadingImage: AppImages.helpCenter,
              title: 'Help Center',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(()=> AboutUsView());
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
