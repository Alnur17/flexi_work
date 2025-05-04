import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../home/views/home_view.dart';
import '../controllers/user_dashboard_controller.dart';

class UserDashboardView extends GetView<UserDashboardController> {
  final UserDashboardController userDashboardController =
      Get.put(UserDashboardController());

  UserDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(() {
                  return IndexedStack(
                    index: userDashboardController.selectedIndex.value,
                    children: [
                      HomeView(),
                      Container(color: Colors.red),
                      Container(color: Colors.green),
                      Container(color: Colors.blue),
                    ],
                  );
                }),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.green)),
              child: GNav(
                backgroundColor: AppColors.transparent,
                activeColor: AppColors.textColorBlue,
                textStyle: h3.copyWith(color: AppColors.white),
                gap: 8,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                onTabChange: userDashboardController.onItemTapped,
                selectedIndex: userDashboardController.selectedIndex.value,
                tabs: [
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(
                        () => userDashboardController.selectedIndex.value == 0
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.homeFilled,
                                ),
                              )
                            : SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.home,
                                ),
                              )),
                    text: 'Home',
                    backgroundColor: AppColors.blue,
                  ),
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(
                        () => userDashboardController.selectedIndex.value == 1
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.cartFilled,
                                ),
                              )
                            : SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.cart,
                                ),
                              )),
                    text: 'Cart',
                    backgroundColor: AppColors.blue,
                  ),
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(
                        () => userDashboardController.selectedIndex.value == 2
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.chat,
                                ),
                              )
                            : SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.chat,
                                ),
                              )),
                    text: 'Chat',
                    backgroundColor: AppColors.blue,
                  ),
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(
                        () => userDashboardController.selectedIndex.value == 3
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.profileFilled,
                                ),
                              )
                            : SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  AppImages.profile,
                                  //color: Colors.grey,
                                ),
                              )),
                    text: 'Profile',
                    backgroundColor: AppColors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
