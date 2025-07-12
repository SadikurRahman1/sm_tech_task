import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sm_tech_task/app/app_colors.dart';
import 'package:sm_tech_task/features/forgot_password/controller/otp_verification_controller.dart';
import 'package:sm_tech_task/features/forgot_password/screen/reset_password_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  static const name = '/otp-verification';

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OtpVerificationController());

    final _formKey = GlobalKey<FormState>();
    final TextEditingController pinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Verify Code',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      // email String, Rx নয়, Obx দরকার নেই
                      Text(
                        'Please enter the code we just sent to email ${controller.email}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 280,
                child: PinCodeTextField(
                  controller: pinController,
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => controller.otpController.value = val,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: AppColors.themeColor,
                    inactiveColor: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                    fieldWidth: 50,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (controller.verifyOtp(controller.otpController.value)) {
                      Get.offNamed(ResetPasswordScreen.name);
                    } else {
                      Get.snackbar(
                        'Error',
                        'Invalid OTP. Please try again.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  }
                },
                child: const Text('Next'),
              ),
              const SizedBox(height: 24),
              Obx(() {
                if (!controller.enableResendButton.value) {
                  return RichText(
                    text: TextSpan(
                      text: 'This code will expire in ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: '${controller.remainingTime.value}s',
                          style: const TextStyle(color: AppColors.themeColor),
                        ),
                      ],
                    ),
                  );
                } else {
                  return TextButton(
                    onPressed: controller.resendCode,
                    child: const Text('Resend code'),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
