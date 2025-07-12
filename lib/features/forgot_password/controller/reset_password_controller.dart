import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/assets_path.dart';
import 'package:sm_tech_task/features/auth/widgets/custom_alert_dialog.dart';
import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void clearTextFields() {
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;

    final password = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      Get.snackbar('Error', "Passwords don't match",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    clearTextFields();

    Get.dialog(
      CustomAlertDialog(
        imagePath: AssetsPath.listImage,
        title: 'Success',
        message: 'Your password is successfully created',
        buttonText: 'Continue',
        nextPageRoute: EnableLocationScreen(),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
