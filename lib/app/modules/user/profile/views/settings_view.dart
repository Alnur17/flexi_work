import 'package:flexi_work/app/modules/user/profile/controllers/profile_controller.dart';
import 'package:flexi_work/app/modules/user/profile/views/change_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_list_tile_with_color.dart';
import '../../user_dashboard/views/user_dashboard_view.dart';

class SettingsView extends GetView {
  SettingsView({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:  AppBar(
        backgroundColor: AppColors.transparent,
        title: const Text('Settings'),
        leading: GestureDetector(
          onTap: () {
            Get.off(()=>UserDashboardView(index: 3,),preventDuplicates: false);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            sh20,
            CustomListTileWithColor(
              leadingIconPath: AppImages.lock,
              trailingIconPath: AppImages.arrowRight,
              title: 'Change password',
              onTap: () {
                Get.off(()=> ChangePasswordView(),preventDuplicates: false);
              },
            ),
            sh16,
            CustomListTileWithColor(
                leadingIconPath: AppImages.delete,
                title: 'Delete account',
                onTap: () {
                  showDeleteAccountDialog(context);
                })
          ],
        ),
      ),
    );
  }

  Future showDeleteAccountDialog(BuildContext context) {
    return Get.defaultDialog(
      title: "Delete Your Account",
      titlePadding: EdgeInsets.only(top: 16),
      backgroundColor: AppColors.white,
      radius: 8,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Text(
              "Are you sure you want to delete your account?",
              style: h4.copyWith(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          sh20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.red),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(4),
                      bottom: Radius.circular(4),
                    ),
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: h2.copyWith(fontSize: 12, color: AppColors.red),
                ),
              ),
              sw10,
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45, vertical: 10), // Box-like padding
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(4),
                      bottom: Radius.circular(4),
                    ),
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  "Delete",
                  style: h2.copyWith(fontSize: 12, color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
