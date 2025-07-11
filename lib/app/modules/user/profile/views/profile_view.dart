import 'package:flexi_work/app/modules/user/profile/views/help_center_view.dart';
import 'package:flexi_work/app/modules/user/profile/views/policies_view.dart';
import 'package:flexi_work/app/modules/user/profile/views/settings_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/local_store/local_store.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../../../auth/login/views/login_view.dart';
import '../../order_details/views/order_details_view.dart';
import '../../user_dashboard/views/user_dashboard_view.dart';
import '../controllers/profile_controller.dart';
import 'about_us_view.dart';
import 'account_view.dart';

class ProfileView extends GetView {
  ProfileView({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: () {
            Get.off(()=>UserDashboardView(index: 0,),preventDuplicates: false);
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        title: const Text('Profile'),
        actions: [
          InkWell(
            onTap: () {
              Get.off(()=>SettingsView(),preventDuplicates: false);
            },
            child: Image.asset(
              AppImages.settings,
              scale: 4,
            ),
          ),

          SizedBox(width: 15,)

        ],
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await profileController.getUserProfileController();
          await profileController.getContentController();
        },
        child: SingleChildScrollView(
          child: Shimmer(
            enabled: profileController.isLoading.value,
            color: AppColors.gray,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sh20,
                profileController.profileResponseModel.value.data?.photoUrl == null ?
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(AppImages.profileImageTwo),
                ) :
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(profileController.profileResponseModel.value.data?.photoUrl),
                ),
                sh8,
                Text(
                  profileController.profileResponseModel.value.data?.name ?? "",
                  style: h5.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sh5,
                Text(
                  profileController.profileResponseModel.value.data?.email ?? "",
                  style: h6.copyWith(
                    color: AppColors.black100,
                  ),
                ),
                sh20,
                CustomListTile(
                  onTap: () {
                    Get.off(()=> AccountView(),preventDuplicates: false);
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
                // CustomListTile(
                //   onTap: () {
                //     Get.to(()=> AddressView());
                //   },
                //   leadingImage: AppImages.account,
                //   title: 'Address',
                //   trailingImage: AppImages.arrowRightSmall,
                // ),
                // sh12,
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
                  title: 'Terms of Services',
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
                    onPressed: () async {
                      LocalStorage.removeData(key: AppConstant.token);
                      LocalStorage.removeData(key: AppConstant.getProfileResponse);
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
        ),
      ),
    ));
  }
}
