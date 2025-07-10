import 'package:flexi_work/app/modules/user/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/const_text/const_text.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../user_dashboard/views/user_dashboard_view.dart';

class PoliciesView extends GetView {
  PoliciesView({super.key});

  final ProfileController profileController = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Text('Privacy Policy',style: titleStyle,),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.off(()=>UserDashboardView(index: 3,),preventDuplicates: false);
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await profileController.getContentController();
        },
        child: Shimmer(
          color: AppColors.gray,
          enabled: profileController.isLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sh30,

                  Container(
                    width: MediaQuery.sizeOf(context).height / 1,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: HtmlWidget(
                      '''${profileController.contentResponseModel.value.data?.first.privacyPolicy}''',
                      textStyle: h4.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
