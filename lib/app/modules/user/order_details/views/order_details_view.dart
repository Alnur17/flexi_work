
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
        title: const Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sh20,
            OrderDetailsHeader(),
            sh12,
            //ShippingInformationWidget(),
            sh12,
            DeliveryAddressWidget(),
            sh12,
            OrderItemsWidget(),
            sh12,
            OrderStatusWidget(),
            sh12
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.silver)),
          color: AppColors.bottomNavbar,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              width: 150,
              text: 'Buy Again',
              onPressed: () {},
              imageAssetPath: AppImages.cartFilled,
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: AppColors.gradientColor,
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipped!',
                style: h3.copyWith(
                  fontSize: 18,
                ),
              ),
              Text(
                'Your order is on the way!!',
                style: h5,
              ),
            ],
          ),
          Image.asset(
            AppImages.car,
            scale: 4,
          ),
        ],
      ),
    );
  }
}

class ShippingInformationWidget extends StatelessWidget {
  const ShippingInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderDetailsController());

    return Obx(() {
      return controller.showShippingDetails.value
          ? _buildDetailedView(controller)
          : _buildDefaultView(controller);
    });
  }

  Widget _buildDefaultView(OrderDetailsController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silver),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              AppImages.car,
              scale: 4,
            ),
          ),
          sw12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Information',
                  style: h5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sh5,
                Text(
                  'Standard Local',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
                sh5,
                Text(
                  'ID #12345',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
                sh5,
                Text(
                  '123 Main Street, Berlin, Germany, 10115',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
              ],
            ),
          ),
          sw12,
          GestureDetector(
            onTap: () {
              controller.toggleShippingDetails();
            },
            child: Text(
              'View',
              style: h5.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textColorBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedView(OrderDetailsController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silver),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  AppImages.car,
                  scale: 4,
                ),
              ),
              sw8,
              Text(
                'Shipping Information',
                style: h5.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Column(
            children: [
              _buildTimelineStep(
                title: 'Order Confirmed',
                subtitle: 'April 27, 2023, 09:34 AM',
                isCompleted: true,
              ),
              _buildTimelineStep(
                title: 'Packed and Ready to Ship',
                subtitle: 'April 27, 2023, 10:15 AM',
                isCompleted: true,
              ),
              _buildTimelineStep(
                title: 'Package Picked Up',
                subtitle: 'April 27, 2023, 11:00 AM',
                isCompleted: true,
              ),
              _buildTimelineStep(
                title: 'Arrived at Logistic Hub',
                subtitle: 'April 27, 2023, 11:30 AM',
                isCompleted: false,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              controller.toggleShippingDetails();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Back',
                style: h5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.circle_outlined,
              color: isCompleted ? AppColors.textColorBlue : AppColors.silver,
            ),
            Container(
              width: 2,
              height: 40,
              color: AppColors.silver,
            ),
          ],
        ),
        sw12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: h5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isCompleted
                      ? AppColors.textColorBlue
                      : AppColors.black100,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: h6.copyWith(color: AppColors.black100),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.silver)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              AppImages.locationRound,
              scale: 4,
            ),
          ),
          sw12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address',
                  style: h5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sh5,
                Text(
                  'Lukas Meyer',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
                sh5,
                Text(
                  '098888888***',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
                sh5,
                Text(
                  '123 Main Street, Berlin, Germany, 10115',
                  style: h6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black100,
                  ),
                ),
                // sh8,
                // Container(
                //   alignment: Alignment.center,
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 4,
                //     horizontal: 8,
                //   ),
                //   decoration: BoxDecoration(
                //     color: AppColors.transparent,
                //     borderRadius: BorderRadius.circular(30),
                //     //border: Border.all(color: AppColors.textColorBlue),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Track your order',
                //         style: h6.copyWith(
                //             fontWeight: FontWeight.bold,
                //             color: AppColors.textColorBlue),
                //       ),
                //       Image.asset(
                //         AppImages.arrowRightNormal,
                //         scale: 4,
                //         color: AppColors.textColorBlue,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItemsWidget extends StatelessWidget {
  const OrderItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.silver),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppImages.storeImage,
                      scale: 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                sw12,
                Text(
                  'Gadget Galaxy',
                  style: h5.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sh12,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.silver),
                  ),
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.productImage,
                        scale: 4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                sw8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SonicPulse Pro Over-Ear Headphones',
                        style: h5.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      sh12,
                      Text(
                        '\$89.99',
                        style: h4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                sw5,
                Text(
                  'Qty: 1',
                  style: h4.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sh12,
            Text(
              'Price Details',
              style: h4.copyWith(fontWeight: FontWeight.bold),
            ),
            sh8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price (1 Item)',
                  style: h5,
                ),
                Text(
                  '\$89.99',
                  style: h5,
                ),
              ],
            ),
            sh8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Fee',
                  style: h5,
                ),
                Text(
                  '\$3.99',
                  style: h5,
                ),
              ],
            ),
            sh8,
            Divider(),
            sh8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment:',
                  style: h4.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$93.98',
                  style: h4.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.silver)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              AppImages.orderCircle,
              scale: 4,
            ),
          ),
          sw12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order no.',
                  style: h5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sh5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Status: ',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      'Shipped',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                sh5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Placed on: ',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      'December 26, 2024, 10:45 AM',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                sh5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paid on: ',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      'December 26, 2024, 11:00 AM',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
                sh5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paid by: ',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                    Text(
                      'Credit Card',
                      style: h6.copyWith(
                        color: AppColors.black100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
