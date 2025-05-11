import 'package:flexi_work/app/modules/service_provider/service_provider_task_manager/views/service_details_view.dart';
import 'package:flexi_work/common/app_images/app_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_dropdown.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/search_filed.dart';

class ServiceProviderTaskManagerView extends StatefulWidget {
  const ServiceProviderTaskManagerView({super.key});

  @override
  State<ServiceProviderTaskManagerView> createState() =>
      _ServiceProviderTaskManagerViewState();
}

class _ServiceProviderTaskManagerViewState
    extends State<ServiceProviderTaskManagerView> {
  var selectedValue = 'Pending'.obs;

  final List<Map<String, String?>> dummyData = [
    {
      'customerName': 'Robert Fox',
      'task': 'Moving Service',
      'date': '25 Jan 2025',
      'time': '2:00 PM',
      'status': 'pending',
      'amount': '\$200',
    },
    {
      'customerName': 'Jon',
      'task': 'Moving Service',
      'date': '22 Jan 2025',
      'time': '5:00 PM',
      'status': 'pending',
      'amount': '\$300',
    },
    {
      'customerName': 'Jane',
      'task': 'Moving Service',
      'date': '02 Jan 2025',
      'time': '3:00 PM',
      'status': 'Complete',
      'amount': '\$350',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Task Manager',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFiled(
              onChanged: (value) {},
            ),
            sh20,
            Row(
              children: [
                Obx(
                  () {
                    return CustomDropdown(
                      width: 120,
                      value: selectedValue.value,
                      items: [
                        DropdownMenuItem(
                          value: 'Pending',
                          child: Text('Pending'),
                        ),
                        DropdownMenuItem(
                          value: 'Complete',
                          child: Text('Complete'),
                        ),
                      ],
                      onChanged: (value) {
                        selectedValue.value = value!;
                      },
                    );
                  },
                ),
                Spacer(),
                Image.asset(AppImages.eyeCircle,scale: 4,),
                sw12,
                Image.asset(AppImages.deleteCircle,scale: 4,)
              ],
            ),
            sh20,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: AppColors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Task',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Date',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Time',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Status',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Amount',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: AppColors.white,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    final data = dummyData[index];
                    return ListTile(
                      onTap: () {
                        Get.to(()=> ServiceDetailsView());
                      },
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              data['customerName'] ?? 'N/A',
                              style: h6.copyWith(
                                color: AppColors.black,
                              ),
                              maxLines: 2,textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          sw8,
                          Expanded(
                            child: Text(
                              data['task'] ?? 'No Name',
                              style: h6.copyWith(
                                color: AppColors.black,
                              ),
                              maxLines: 2,textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          sw8,
                          Expanded(
                            child: Text(
                              data['date'] ?? 'No product',
                              style: h6,
                              maxLines: 2,textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          sw8,
                          Expanded(
                            child: Text(
                              data['time'] ?? '0',
                              style: h6,
                              maxLines: 1,textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          sw8,
                          Expanded(
                            child: Text(
                              data['status'] ?? '0',
                              style: h6,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          //sw8,
                          Expanded(
                            child: Text(
                              data['amount'] ?? '\$0',
                              style: h6,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
