import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_colors.dart';
import 'package:sm_tech_task/app/app_constants.dart';
import 'package:sm_tech_task/features/auth/controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const name = '/sign-up';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const Text(
                  'Welcome to Eduline',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!',
                  style: TextStyle(fontSize: 14),
                ),

                const SizedBox(height: 40),

                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email Address'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Email can\'t be empty';
                          if (!AppConstants.emailRegex.hasMatch(value)) return 'Invalid Email';
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      const Text('Full Name'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(hintText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Enter Name';
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      const Text('Password'),
                      const SizedBox(height: 8),
                      Obx(() => TextFormField(
                        obscureText: !controller.isPasswordVisible.value,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Password can\'t be empty';
                          if (!RegExp(r'[A-Z]').hasMatch(value)) return 'One uppercase required';
                          if (!RegExp(r'[a-z]').hasMatch(value)) return 'One lowercase required';
                          if (!RegExp(r'[0-9]').hasMatch(value)) return 'One number required';
                          if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) return 'One special char required';
                          if (value.length < 6) return 'Minimum 6 characters';
                          return null;
                        },
                      )),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.submitSignUp,
                  child: const Text('Sign Up'),
                ),

                const SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Sign In',
                          style: const TextStyle(color: AppColors.themeColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
