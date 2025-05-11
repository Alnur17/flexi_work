import 'package:fl_chart/fl_chart.dart';
import 'package:flexi_work/app/modules/service_provider/service_provider_chats/views/service_provider_chats_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_dropdown.dart';
import '../../../../../common/helper/service_offer_card.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class ServiceProviderHomeView extends StatefulWidget {
  const ServiceProviderHomeView({super.key});

  @override
  State<ServiceProviderHomeView> createState() =>
      _ServiceProviderHomeViewState();
}

class _ServiceProviderHomeViewState extends State<ServiceProviderHomeView> {
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
              Get.to(()=> ServiceProviderChatsView());
            },
            child: Container(
              padding: EdgeInsets.all(6),
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh16,
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Revenue',
                      style: h6.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$8322',
                      style: h3.copyWith(
                        color: AppColors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
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
                                    color: Colors.green.shade800,
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
                                    color: Colors.green.shade700,
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
                                    color: Colors.green.shade600,
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
                                    color: Colors.green.shade500,
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
                                    color: Colors.green.shade400,
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
                                    color: Colors.green.shade300,
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
                                    color: Colors.green.shade800,
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
                                    color: Colors.green.shade700,
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
                                    color: Colors.green.shade600,
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
                                    color: Colors.green.shade500,
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
                                    color: Colors.green.shade400,
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
                                    color: Colors.green.shade300,
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
              sh20,
              Text(
                'News Tasks',
                style: h3.copyWith(
                  fontSize: 20,
                ),
              ),
              sh12,
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: index == 5 - 1 ? 100 : 8),
                  child: ServiceOfferCard(
                    title: 'Moving Service',
                    clientName: 'Sarah Lee',
                    date: '25 January 2025',
                    time: '2:00 PM',
                    location: 'Downtown Los Angeles, CA',
                    onAccept: () {},
                    onReject: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
