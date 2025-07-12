import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';
import 'package:sm_tech_task/features/auth/widgets/custom_alert_dialog.dart';
import 'package:sm_tech_task/app/assets_path.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void submitSignUp() {
    if (!formKey.currentState!.validate()) return;

    clearFields();

    Get.dialog(CustomAlertDialog(
      imagePath: AssetsPath.successImage,
      title: 'Successfully Registered',
      message: 'Your account has been registered successfully, now let’s enjoy our features!',
      buttonText: 'Continue',
      nextPageRoute: EnableLocationScreen(),
    ));
  }

  void clearFields() {
    emailController.clear();
    fullNameController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
