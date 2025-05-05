import 'package:flexi_work/app/modules/user/payment/views/payment_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class PaymentConfirmationView extends StatefulWidget {

  const PaymentConfirmationView({super.key,});

  @override
  State<PaymentConfirmationView> createState() =>
      _PaymentConfirmationViewState();
}

class _PaymentConfirmationViewState extends State<PaymentConfirmationView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      return Get.off(() => PaymentDetailsView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        //title: Text('Payment Confirmation', style: appBarStyle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.payment,
              scale: 4,
            ),
            sh8,
            Text(
              'Payment Successful',
              style: h3,
            )
          ],
        ),
      ),
    );
  }
}
