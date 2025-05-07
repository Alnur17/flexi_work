import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../service_provider_home/views/service_provider_home_view.dart';
import '../controllers/service_provider_dashboard_controller.dart';

class ServiceProviderDashboardView
    extends GetView<ServiceProviderDashboardController> {
  final ServiceProviderDashboardController serviceProviderDashboardController =
      Get.put(ServiceProviderDashboardController());

  ServiceProviderDashboardView({super.key});

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
                    index:
                        serviceProviderDashboardController.selectedIndex.value,
                    children: [
                      ServiceProviderHomeView(),
                      Container(),
                      Container(),
                      Container(),
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                onTabChange: serviceProviderDashboardController.onItemTapped,
                selectedIndex:
                    serviceProviderDashboardController.selectedIndex.value,
                tabs: [
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(() => serviceProviderDashboardController
                                .selectedIndex.value ==
                            0
                        ? Image.asset(
                            AppImages.homeFilled,
                            scale: 4,
                            width: 24,
                            height: 24,
                          )
                        : Image.asset(
                            AppImages.home,
                            scale: 4,
                            width: 24,
                            height: 24,
                          )),
                    text: 'Home',
                    backgroundColor: AppColors.blue,
                  ),
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(() => serviceProviderDashboardController
                                .selectedIndex.value ==
                            1
                        ? Image.asset(
                            AppImages.orderFilled,
                            scale: 4,
                            width: 24,
                            height: 24,
                          )
                        : Image.asset(
                            AppImages.order,
                            scale: 4,
                            width: 24,
                            height: 24,
                          )),
                    text: 'Task Manager',
                    backgroundColor: AppColors.blue,
                  ),
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(
                      () => serviceProviderDashboardController
                                  .selectedIndex.value ==
                              2
                          ? Image.asset(
                              AppImages.earningFilled,
                              scale: 4,
                              width: 24,
                              height: 24,
                            )
                          : Image.asset(
                              AppImages.earning,
                              scale: 4,
                              width: 24,
                              height: 24,
                            ),
                    ),
                    text: 'Earnings',
                    backgroundColor: AppColors.blue,
                  ),
                  GButton(
                    icon: Icons.circle,
                    leading: Obx(
                      () => serviceProviderDashboardController
                                  .selectedIndex.value ==
                              3
                          ? Image.asset(
                              AppImages.profileFilled,
                              scale: 4,
                              width: 24,
                              height: 24,
                            )
                          : Image.asset(
                              AppImages.profile,
                              scale: 4,
                              width: 24,
                              height: 24,
                            ),
                    ),
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
