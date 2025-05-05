
import 'package:flexi_work/common/widgets/custom_row_header.dart';
import 'package:flexi_work/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../data/dummydata.dart';
import '../controllers/tasker_profile_controller.dart';

class TaskerProfileView extends StatefulWidget {
  const TaskerProfileView({super.key});

  @override
  State<TaskerProfileView> createState() => _TaskerProfileViewState();
}

class _TaskerProfileViewState extends State<TaskerProfileView> {
  final TaskerProfileController controller = Get.put(TaskerProfileController());

  final List<String> skills = [
    'Pipe Installation & Repair',
    'Leak Detection & Fixing',
    'Drain Cleaning & Unclogging',
    'Water Heater Installation & Maintenance',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.storeColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.storeColor,
          title: const Text(
            'Tasker Profile',
            style: TextStyle(color: AppColors.white),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                AppImages.back,
                scale: 4,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(AppImages.storeImage),
                  ),
                  sh8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lukas Wagner',
                        style: h1.copyWith(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      sw8,
                      Text(
                        '(Plumber)',
                        style: h5.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  sh8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: 'Open to Work',
                        onPressed: () {},
                        width: 140,
                        height: 35,
                        textStyle: h6.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        backgroundColor: AppColors.green,
                      ),
                      sw12,
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 16,
                      ),
                      sw5,
                      Text(
                        '4.5',
                        style: h5.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sh20,
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TabBar(
                labelStyle: h4.copyWith(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'Reviews'),
                ],
                labelColor: AppColors.orange,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.orange,
                overlayColor: WidgetStatePropertyAll(AppColors.transparent),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sh20,
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
                    ),
                  ),
                  Container(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sh16,
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '4.5',
                                      style: h2,
                                    ),
                                    sh8,
                                    Image.asset(
                                      AppImages.star,
                                      scale: 4,
                                    ),
                                    sh8,
                                    Text(
                                      '5,922 Reviews',
                                      style: h5.copyWith(color: AppColors.grey),
                                    ),
                                  ],
                                ),
                                sw40,
                                Expanded(
                                  child: Column(
                                    children: [
                                      for (int i = 5; i > 0; i--)
                                        Row(
                                          children: [
                                            Text('$i★',
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: LinearProgressIndicator(
                                                minHeight: 6,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                value: i == 5
                                                    ? 0.8
                                                    : i == 4
                                                        ? 0.4
                                                        : i == 3
                                                            ? 0.6
                                                            : i == 2
                                                                ? 0.2
                                                                : 0.1,
                                                backgroundColor:
                                                    Colors.grey[300],
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  AppColors.textColorBlue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            sh20,
                            CustomButton(
                              text: 'Write a Review',
                              onPressed: () {
                                //Get.to(()=> WriteReviewView());
                              },
                              borderColor: AppColors.grey,
                              backgroundColor: AppColors.transparent,
                              textColor: AppColors.orange,
                            ),
                            sh20,
                            CustomRowHeader(
                              title: 'Reviews',
                              subtitle: Text(
                                'Show all..',
                                style: h5.copyWith(color: AppColors.red),
                              ),
                              onTap: () {},
                            ),
                            sh12,
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: DummyData.reviewData.length,
                              itemBuilder: (context, index) {
                                final data = DummyData.reviewData[index];
                                return GestureDetector(
                                  onTap: () {
                                    // Get.to(() => );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: index ==
                                              DummyData.reviewData.length - 1
                                          ? 80
                                          : 12,
                                    ),
                                    padding: EdgeInsets.only(
                                      top: 12,
                                      bottom: 8,
                                      left: 12,
                                      right: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImages.star,
                                          scale: 4,
                                        ),
                                        sh12,
                                        ReadMoreText(
                                          data['message'],
                                          trimLines: 3,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Show More',
                                          trimExpandedText: ' Show Less',
                                          style: h6,
                                          moreStyle: h6.copyWith(
                                            color: AppColors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          lessStyle: h6.copyWith(
                                            color: AppColors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Divider(),
                                        ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: CircleAvatar(
                                            radius: 20,
                                            backgroundImage:
                                                NetworkImage(data['imageUrl']),
                                          ),
                                          title: Text(data['name'], style: h4),
                                          trailing:
                                              Text(data['date'], style: h6),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            color: AppColors.bottomNavbar,
            border: Border(top: BorderSide(color: AppColors.green)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                height: 40,
                width: 130,
                text: 'Message',
                onPressed: () {},
                imageAssetPath: AppImages.mail,
                imageAssetPathColor: AppColors.white,
                textStyle: h5.copyWith(color: AppColors.white),
                gradientColors: AppColors.gradientColor,
              ),
              sw12,
              CustomButton(
                height: 40,
                width: 140,
                text: 'Booking Request',
                onPressed: () {
                  showTaskFormBottomSheet(context);
                },
                textStyle: h5.copyWith(color: AppColors.white),
                gradientColors: AppColors.gradientColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTaskFormBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task Description', style: h3),
              sh8,
              CustomTextField(
                hintText: 'Describe the work needed',
              ),
              sh16,
              Text('Estimated Time', style: h3),
              sh8,
              CustomTextField(
                hintText: 'Describe the work needed',
              ),
              sh16,
              Text('Preferred Time', style: h3),
              sh8,
              CustomTextField(
                hintText: 'Describe the work needed',
              ),
              sh16,
              Text('Location', style: h3),
              sh8,
              CustomTextField(
                hintText: 'Describe the work needed',
              ),
              sh16,
              CustomButton(
                text: 'Send',
                onPressed: () {},
                gradientColors: AppColors.gradientColor,
              ),
              sh16,
            ],
          ),
        );
      },
    );
  }
}
