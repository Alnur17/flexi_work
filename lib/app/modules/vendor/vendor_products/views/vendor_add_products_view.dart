import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/upload_widget.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_circular_container.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class VendorAddProductsView extends GetView {
  const VendorAddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Add Products',
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () {
              Get.back();
            },
            padding: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Image',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              UploadWidget(
                onTap: () {},
                imagePath: AppImages.add,
                label: 'Upload',
              ),
              sh16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadWidget(
                    height: 75,
                    width: Get.width * 0.28,
                    onTap: () {},
                    imagePath: AppImages.add,
                    label: 'Upload',
                  ),
                  UploadWidget(
                    height: 75,
                    width: Get.width * 0.28,
                    onTap: () {},
                    imagePath: AppImages.add,
                    label: 'Upload',
                  ),
                  UploadWidget(
                    height: 75,
                    width: Get.width * 0.28,
                    onTap: () {},
                    imagePath: AppImages.add,
                    label: 'Upload',
                  ),
                ],
              ),
              sh16,
              Text(
                'Product Name',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              CustomTextField(
                hintText: 'Write a product details',
              ),
              sh16,
              Text(
                'Product Details',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              CustomTextField(
                height: 100,
                hintText: 'Write a product details',
              ),
              sh16,
              Text(
                'Category Name',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              CustomTextField(),
              sh16,
              Text(
                'Product Price',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              CustomTextField(),
              sh16,
              Text(
                'Product Quantity',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              CustomTextField(),
              sh16,
              Text(
                'Discount % (if)',
                style: h5.copyWith(
                  color: AppColors.black,
                ),
              ),
              sh12,
              CustomTextField(
                hintText: 'Discount %',
              ),
              sh60,
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        color: AppColors.mainColor,
        child: CustomButton(
          text: 'Save',
          onPressed: () {},
          gradientColors: AppColors.gradientColor,
        ),
      ),
    );
  }
}
