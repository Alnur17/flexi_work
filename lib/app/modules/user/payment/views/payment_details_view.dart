import 'package:flexi_work/app/modules/user/user_dashboard/views/user_dashboard_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';

class PaymentDetailsView extends GetView {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Payment Details',
          style: appBarStyle,
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  sh40,
                  Text(
                    'Payment Total',
                    style: h5.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  sh8,
                  Text(
                    '\$89.99',
                    style: h2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sh20,
                  _buildRow('Date', '31 Dec 2023'),
                  _buildRow('Transaction ID', '#123456789'),
                  _buildRow('Account', 'Neeraj'),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  _buildRow('Total Payment', '\$89.99'),
                  _buildRow('Total', '\$89.99'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.white,
              child: Image.asset(
                AppImages.payment,
                scale: 4,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //color: AppColors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: 'Get PDF Receipt',
              onPressed: () {},
              textColor: AppColors.blue,
              imageAssetPath: AppImages.download,
              borderColor: AppColors.blue,
            ),
            sh10,
            CustomButton(
              text: 'Back to Homepage',
              onPressed: () {
                Get.offAll(()=> UserDashboardView(index: 2,));
              },
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: h5.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          Text(
            value,
            style: h5.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../../../../../common/app_color/app_colors.dart';
// import '../../../../../common/app_images/app_images.dart';
// import '../../../../../common/app_text_style/styles.dart';
// import '../../../../../common/size_box/custom_sizebox.dart';
// import '../../../../../common/widgets/custom_button.dart';
// import '../../user_dashboard/views/user_dashboard_view.dart';
//
// class PaymentDetailsView extends StatefulWidget {
//   const PaymentDetailsView({super.key});
//
//   @override
//   State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
// }
//
// class _PaymentDetailsViewState extends State<PaymentDetailsView> {
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: AppColors.white,
//         automaticallyImplyLeading: false,
//         // leading: GestureDetector(
//         //   onTap: () {
//         //     Get.back();
//         //   },
//         //   child: Container(
//         //     margin: EdgeInsets.only(left: 20),
//         //     decoration: ShapeDecoration(
//         //       shape: CircleBorder(),
//         //       color: AppColors.silver,
//         //     ),
//         //     child: Image.asset(
//         //       AppImages.close,
//         //       scale: 4,
//         //     ),
//         //   ),
//         // ),
//         title: Text(
//           'Payment Details',
//           style: appBarStyle,
//         ),
//       ),
//       body: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 10,
//                     offset: Offset(0, 4),
//                   )
//                 ],
//               ),
//               child: Obx(
//                     () {
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       sh40,
//                       Text(
//                         'Payment Total',
//                         style: h5.copyWith(
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.grey,
//                         ),
//                       ),
//                       sh8,
//                       Text(
//                         "\$${paymentController.paymentDetailsData.value?.amount.toString() ?? ''}",
//                         style: h2.copyWith(
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       sh20,
//                       Text(
//                         'Date'
//                       ),
//                       _buildRow(
//                         'Transaction ID',
//                         paymentController.paymentDetailsData.value?.dataId ?? '',
//                       ),
//                       _buildRow(
//                         'Account',
//                         paymentController
//                             .paymentDetailsData.value?.account?.name ??
//                             '',
//                       ),
//                       Divider(
//                         color: Colors.grey.shade200,
//                       ),
//                       _buildRow(
//                         'Total Payment',
//                         "\$${paymentController.paymentDetailsData.value?.amount.toString() ?? ''}",
//                       ),
//                       _buildRow(
//                         'Total',
//                         "\$${paymentController.paymentDetailsData.value?.amount.toString() ?? ''}",
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             top: 15,
//             left: 0,
//             right: 0,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundColor: AppColors.white,
//               child: Image.asset(
//                 AppImages.payment,
//                 scale: 4,
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         //color: AppColors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomButton(
//               text: 'Get PDF Receipt',
//               onPressed: () async {
//                 if (paymentController.paymentDetailsData.value != null) {
//                   await pdfController.generateAndSavePDF();
//                 } else {
//                   Get.snackbar(
//                     'Error',
//                     'Payment details not available',
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 }
//               },
//               textColor: AppColors.black,
//               imageAssetPath: AppImages.arrowDown,
//               borderColor: AppColors.grey,
//             ),
//             sh10,
//             CustomButton(
//               text: 'Back to Homepage',
//               onPressed: () {
//                 Get.offAll(()=> UserDashboardView());
//               },
//               textColor: AppColors.textColorBlue,
//               imageAssetPath: AppImages.arrowRightSmall,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: h5.copyWith(
//               fontWeight: FontWeight.w500,
//               color: AppColors.grey,
//             ),
//           ),
//           Text(
//             value,
//             style: h5.copyWith(
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
