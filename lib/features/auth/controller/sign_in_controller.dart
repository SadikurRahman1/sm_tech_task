import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isChecked = false.obs;
  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    const adminEmail = "admin@gmail.com";
    const adminPassword = "Admin@123";

    if (email == adminEmail && password == adminPassword) {
      Get.offNamed(EnableLocationScreen.name);
    } else {
      Get.snackbar("Login Failed", "Invalid email or password",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
