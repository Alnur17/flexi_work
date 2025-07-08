import 'package:flexi_work/common/helper/upload_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'package:intl/intl.dart';
import 'dart:io'; // For File handling

import '../../../../../../common/app_color/app_colors.dart';
import '../../../../../../common/app_text_style/styles.dart';
import '../../../../../../common/size_box/custom_sizebox.dart';
import '../../app/modules/auth/signup/controllers/signup_controller.dart';
import '../app_images/app_images.dart';
import '../widgets/custom_textfield.dart';

class SignupBodyWidget extends StatefulWidget {
  const SignupBodyWidget({super.key});

  @override
  State<SignupBodyWidget> createState() => _SignupBodyWidgetState();
}

class _SignupBodyWidgetState extends State<SignupBodyWidget> {
  final SignupController signupController = Get.put(SignupController());

  String? _selectedJobTitle;
  final ImagePicker _picker = ImagePicker();
  File? _capturedImage;

  Future<void> _takePicture() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );
      if (image != null) {
        setState(() {
          _capturedImage = File(image.path);
        });
      }
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRoleOption('User', 'user'),
            _buildRoleOption('Vendor', 'vendor'),
            _buildRoleOption('Service Provider', 'service_provider'),
          ],
        ),
        sh16,
        Obx(
          () {
            switch (signupController.selectedRole.value) {
              case 'user':
                return _buildUserInterface(context: context);
              case 'vendor':
                return _buildVendorInterface();
              case 'service_provider':
                return _buildServiceProviderInterface();
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  Widget _buildRoleOption(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Obx(
        () {
          bool isSelected = signupController.selectedRole.value == value;
          return GestureDetector(
            onTap: () => signupController.selectRole(value),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.orange : AppColors.silver,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                label,
                style: h5.copyWith(
                  color: isSelected ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserInterface({required BuildContext context}) {
    return Obx(()=>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name', style: h5),
        sh8,
        CustomTextField(
          controller: signupController.fullNameController.value,
          hintText: 'Your name',
        ),
        sh12,
        Text('Birth Date', style: h5),
        sh8,
        CustomTextField(
          controller: signupController.birthDateController.value,
          hintText: 'Enter your birth date',
          onTap: () async {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            ).then((value) {
              if(value != null) {
                signupController.birthDateController.value.text = DateFormat("yyyy-MM-dd").format(value);
              }
            });
          },
        ),
        sh12,
        Text('Mobile Number', style: h5),
        sh8,
        CustomTextField(
          controller: signupController.mobileNumberController.value,
          hintText: 'Enter your mobile number',
        ),
        sh12,
        Text('Email', style: h5),
        sh8,
        CustomTextField(
          controller: signupController.emailController.value,
          hintText: 'Enter your email',
        ),
        sh12,
        Text('Create a Password', style: h5),
        sh8,
        CustomTextField(
          hintText: '*************',
          controller: signupController.passwordController.value,
        ),
      ],
    ));
  }

  Widget _buildVendorInterface() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name', style: h5),
        sh8,
        CustomTextField(hintText: 'Your name'),
        sh12,
        Text('Birth Date', style: h5),
        sh8,
        CustomTextField(hintText: 'Enter your birth date'),
        sh12,
        Text('Mobile Number', style: h5),
        sh8,
        CustomTextField(hintText: 'Enter your mobile number'),
        sh12,
        Text('Email', style: h5),
        sh8,
        CustomTextField(hintText: 'Enter your email'),
        sh12,
        Text('Create a Password', style: h5),
        sh8,
        CustomTextField(hintText: '*************'),
        sh12,
        Text('Upload Legal ID', style: h5),
        sh8,
        UploadWidget(
          onTap: () {},
          imagePath: AppImages.upload,
          label: 'Upload',
          isFile: false, // Asset
        ),
        sh12,
        Text('Bank Statement', style: h5),
        sh8,
        UploadWidget(
          onTap: () {},
          imagePath: AppImages.upload,
          label: 'Upload Statement',
          isFile: false,
        ),
        sh12,
        Text('Face Verification', style: h5),
        sh8,
        UploadWidget(
          onTap: _takePicture,
          imagePath: _capturedImage?.path ?? AppImages.upload,
          label: 'Verify Face',
          isFile: _capturedImage != null,
        ),
      ],
    );
  }

  Widget _buildServiceProviderInterface() {
    final List<String> jobTitles = [
      'Plumber',
      'Carpenter',
      'Electrician',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name', style: h5),
        sh8,
        CustomTextField(hintText: 'Your name'),
        sh12,
        Text('Email', style: h5),
        sh8,
        CustomTextField(hintText: 'Enter your email'),
        sh12,
        Text('Mobile Number', style: h5),
        sh8,
        CustomTextField(hintText: 'Enter your mobile number'),
        sh12,
        Text('Create a Password', style: h5),
        sh8,
        CustomTextField(hintText: '*************'),
        sh12,
        Text('Birth Date', style: h5),
        sh8,
        CustomTextField(hintText: 'Enter your birth date'),
        sh12,
        Text('Job Title', style: h5),
        sh8,
        DropdownButtonFormField<String>(
          dropdownColor: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          //padding: EdgeInsets.symmetric(horizontal: 20),
          value: _selectedJobTitle,
          hint: Text(
            'Select your Job Title',
            style: h5.copyWith(
              color: AppColors.grey,
            ),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: jobTitles.map((String title) {
            return DropdownMenuItem<String>(
              value: title,
              child: Text(
                title,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedJobTitle = newValue;
            });
          },
        ),
        sh12,
        Text('Upload Legal ID', style: h5),
        sh8,
        UploadWidget(
          onTap: () {},
          imagePath: AppImages.upload,
          label: 'Upload ID',
          isFile: false,
        ),
        sh12,
        Text('Bank Statement', style: h5),
        sh8,
        UploadWidget(
          onTap: () {},
          imagePath: AppImages.upload,
          label: 'Upload Statement',
          isFile: false,
        ),
        sh12,
        Text('Face Verification', style: h5),
        sh8,
        UploadWidget(
          onTap: _takePicture,
          imagePath: _capturedImage?.path ?? AppImages.upload,
          label: 'Verify Face',
          isFile: _capturedImage != null,
        ),
      ],
    );
  }
}
