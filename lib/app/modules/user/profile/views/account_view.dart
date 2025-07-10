import 'dart:developer';
import 'dart:io';

import 'package:flexi_work/app/modules/user/profile/views/profile_view.dart';
import 'package:flexi_work/app/modules/user/user_dashboard/views/user_dashboard_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../controllers/profile_controller.dart';

class AccountView extends GetView {
  AccountView({super.key});


  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: GestureDetector(
          onTap: () {
            Get.off(()=>UserDashboardView(index: 3,),preventDuplicates: false);
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        title: const Text('Account'),
      ),
      body: Obx(()=>Shimmer(
        color: AppColors.gray,
        enabled: profileController.isLoading.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [

                        profileController.profileResponseModel.value.data?.photoUrl == null && profileController.imageFile.value.path == "" ?
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(AppImages.profileImageTwo),
                        ) : profileController.imageFile.value.path != "" ?
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: FileImage(profileController.imageFile.value),
                        ) :
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(profileController.profileResponseModel.value.data?.photoUrl),
                        ),

                        Positioned(
                          bottom: -5,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: Text('Select Profile Image'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text('Gallery'),
                                          onTap: () async {
                                            final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                            if (pickedFile != null) {
                                              print('Image selected: ${pickedFile.path}');
                                              profileController.imageFile.value = File(pickedFile.path);
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('No image selected'),
                                                  duration: Duration(seconds: 2),
                                                ),
                                              );
                                            }
                                            Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Camera'),
                                          onTap: () async {
                                            final pickedFile = await ImagePicker().pickImage(
                                                source: ImageSource.camera);
                                            if (pickedFile != null) {
                                              // Handle the picked image (e.g., update profile)
                                              profileController.imageFile.value = File(pickedFile.path);
                                              print('Image selected: ${pickedFile.path}');
                                            } else {
                                              // Show a SnackBar if no image is selected before popping the dialog
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('No image selected'),
                                                  duration: Duration(seconds: 2),
                                                ),
                                              );
                                            }
                                            Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.black,
                              child: Icon(
                                Icons.add,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    sh12,

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        profileController.profileResponseModel.value.data?.name ?? "",
                        style: h5.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    sh5,

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        profileController.profileResponseModel.value.data?.email ?? "",
                        style: h6.copyWith(
                          color: AppColors.black100,
                        ),
                      ),
                    ),
                  ],
                ),
                sh20,
                Text(
                  'Full Name',
                  style: h5,
                ),
                sh8,
                CustomTextField(
                  hintText: 'Lukas Wagner',
                  controller: profileController.nameController.value,
                ),
                sh12,
                Text(
                  'Email address',
                  style: h5,
                ),

                sh8,
                CustomTextField(
                  readOnly: true,
                  hintText: 'lukas.wagner@gmail.com',
                  controller: profileController.emailController.value,
                ),
                sh12,
                Text(
                  'Contact',
                  style: h5,
                ),

                sh8,
                CustomTextField(
                  hintText: "+880 XXXXXXXXXX",
                  controller: profileController.contactController.value,
                ),
                // sh12,
                // CustomRowHeader(
                //   title: 'Location',
                //   subtitle: Image.asset(
                //     AppImages.editRound,
                //     scale: 4,
                //   ),
                //   onTap: () {},
                // ),
                // sh8,
                // CustomTextField(),
                sh60,

                Obx(()=> CustomButton(
                  text: profileController.isSubmit.value == true ? "Submitting ...." : 'Save',
                  onPressed: () async {
                    await profileController.profileUpdateController(
                      image: profileController.imageFile.value,
                      fullName: profileController.nameController.value.text,
                      email: profileController.emailController.value.text,
                      contactNumber: profileController.contactController.value.text,
                      onSuccess: (e) async {
                        kSnackBar(message: "$e", bgColor: AppColors.green);
                      },
                      onFail: (e) async {
                        kSnackBar(message: "$e", bgColor: AppColors.red);
                      },
                      onExceptionFail: (e) async {
                        kSnackBar(message: "$e", bgColor: AppColors.red);
                      },
                    );
                  },
                  gradientColors: AppColors.gradientColor,
                ),),
              ],
            ),
          ),
        ),
      ),)
    );
  }
}
