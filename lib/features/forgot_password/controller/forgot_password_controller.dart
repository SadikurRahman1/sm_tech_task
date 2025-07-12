import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/features/forgot_password/screen/otp_verification_screen.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void onContinuePressed() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      Get.toNamed(OtpVerificationScreen.name, arguments: email);
      clearFields();
    }
  }

  void clearFields() {
    emailController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
