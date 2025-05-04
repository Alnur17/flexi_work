import 'package:get/get.dart';

class SignupController extends GetxController {
  var selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

}
