import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/features/forgot_password/controller/reset_password_controller.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  static const name = '/reset-password';

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () => Get.back(),
                ),
              ),

              const SizedBox(height: 30),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Reset Password',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your password must be at least 8 characters long and include a combination of letters, numbers',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('New Password',
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Obx(
                          () => TextFormField(
                        controller: controller.newPasswordController,
                        obscureText: !controller.isPasswordVisible.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can\'t be empty';
                          } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one number';
                          } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                            return 'Password must contain at least one special character (!@#\$&*~)';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text('Confirm New Password',
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Obx(
                          () => TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: !controller.isPasswordVisible.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password can\'t be empty';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.submit,
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
