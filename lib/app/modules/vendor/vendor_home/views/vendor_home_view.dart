import 'package:fl_chart/fl_chart.dart';
import 'package:flexi_work/app/modules/vendor/vendor_chat/views/vendor_chat_view.dart';
import 'package:flexi_work/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_dropdown.dart';
import '../../../../../common/helper/monthly_card.dart';

class VendorHomeView extends StatefulWidget {
  const VendorHomeView({super.key});

  @override
  State<VendorHomeView> createState() => _VendorHomeViewState();
}

class _VendorHomeViewState extends State<VendorHomeView> {
  var selectedValue = '2025'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AppImages.storeImage),
        ),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(()=> VendorChatView());
            },
            child: Container(
              padding: EdgeInsets.all(6),
              //margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.blue),
              ),
              child: Image.asset(
                AppImages.chat,
                scale: 4,
              ),
            ),
          ),
          sw8,
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.blue),
              ),
              child: Image.asset(
                AppImages.notification,
                scale: 4,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sh16,
              Row(
                children: [
                  Expanded(
                    child: MonthlyCard(
                      title: 'Total Revenue',
                      value: '\$18,322',
                    ),
                  ),
                  sw12,
                  Expanded(
                    child: MonthlyCard(
                      title: 'Total Products',
                      value: '\$45,000',
                    ),
                  ),
                ],
              ),
              sh16,
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Earning Summery',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Obx(
                            () => CustomDropdown(
                              value: selectedValue.value,
                              items: [
                                DropdownMenuItem(
                                  value: '2025',
                                  child: Text('2025'),
                                ),
                                DropdownMenuItem(
                                  value: '2024',
                                  child: Text('2024'),
                                ),
                              ],
                              onChanged: (value) {
                                selectedValue.value = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      sh12,
                      SizedBox(
                        height: 220,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 15,
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const months = [
                                      'Jan',
                                      'Feb',
                                      'Mar',
                                      'Apr',
                                      'May',
                                      'Jun',
                                      'Jul',
                                      'Aug',
                                      'Sep',
                                      'Oct',
                                      'Nov',
                                      'Dec'
                                    ];
                                    return Text(
                                      months[value.toInt()],
                                      style: h7,
                                    );
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 5,
                                  reservedSize: 40,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      '${value.toInt()}K',
                                      style: h7.copyWith(
                                        color: AppColors.black,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                            barGroups: [
                              // Sample data for each month (you can adjust these values)
                              BarChartGroupData(
                                x: 0,
                                barRods: [
                                  BarChartRodData(
                                    toY: 10,
                                    color: Colors.blue.shade800,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 1,
                                barRods: [
                                  BarChartRodData(
                                    toY: 8,
                                    color: Colors.blue.shade700,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 2,
                                barRods: [
                                  BarChartRodData(
                                    toY: 12,
                                    color: Colors.blue.shade600,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 3,
                                barRods: [
                                  BarChartRodData(
                                    toY: 7,
                                    color: Colors.blue.shade500,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 4,
                                barRods: [
                                  BarChartRodData(
                                    toY: 9,
                                    color: Colors.blue.shade400,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 5,
                                barRods: [
                                  BarChartRodData(
                                    toY: 6,
                                    color: Colors.blue.shade300,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 6,
                                barRods: [
                                  BarChartRodData(
                                    toY: 11,
                                    color: Colors.blue.shade800,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 7,
                                barRods: [
                                  BarChartRodData(
                                    toY: 8,
                                    color: Colors.blue.shade700,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 8,
                                barRods: [
                                  BarChartRodData(
                                    toY: 10,
                                    color: Colors.blue.shade600,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 9,
                                barRods: [
                                  BarChartRodData(
                                    toY: 5,
                                    color: Colors.blue.shade500,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 10,
                                barRods: [
                                  BarChartRodData(
                                    toY: 7,
                                    color: Colors.blue.shade400,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 11,
                                barRods: [
                                  BarChartRodData(
                                    toY: 9,
                                    color: Colors.blue.shade300,
                                    width: 16,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              sh100,
            ],
          ),
        ),
      ),
    );
  }
}
