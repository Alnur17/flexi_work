import 'package:flexi_work/app/modules/vendor/vendor_orders/views/vendor_order_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_dropdown.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/search_filed.dart';


class VendorOrdersView extends StatefulWidget {
  const VendorOrdersView({super.key});

  @override
  State<VendorOrdersView> createState() => _VendorOrdersViewState();
}

class _VendorOrdersViewState extends State<VendorOrdersView> {

  var selectedValue = 'Pending'.obs;

  final List<Map<String, String?>> dummyData = [
    {
      'orderId': '01',
      'customerName': 'Robert Fox',
      'productName': 'Nike Air Force 1',
      'quantity': '2',
      'amount': '\$200',
    },
    {
      'orderId': '02',
      'customerName': 'Jane Doe',
      'productName': 'Nike Air Force 3',
      'quantity': '1',
      'amount': '\$400',
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
          'Orders',
        ),
        centerTitle: true,
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
                    'Order ID',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Customer',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Product Name',
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Quantity',
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
                      onTap: (){
                        Get.to(()=> VendorOrderDetailsView());
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: Text(
                        data['orderId'] ?? 'N/A',
                        style: h6.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['customerName'] ?? 'No Name',
                            style: h6.copyWith(
                              color: AppColors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            data['productName'] ?? 'No product',
                            style: h6,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            data['quantity'] ?? '0',
                            style: h6,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      trailing: Text(
                        data['amount'] ?? '\$0',
                        style: h6,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
