import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_colors.dart';
import 'package:sm_tech_task/app/app_constants.dart';
import 'package:sm_tech_task/app/assets_path.dart';
import 'package:sm_tech_task/features/auth/controller/sign_in_controller.dart';
import 'package:sm_tech_task/features/auth/screen/sign_up_screen.dart';
import 'package:sm_tech_task/features/forgot_password/screen/forgot_password.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  static const name = '/sign-in';

  final controller = Get.put(SignInController());
  // final controller = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SvgPicture.asset(AssetsPath.bookImage, width: 80, height: 80),
              const SizedBox(height: 30),
              const Text('Welcome Back!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('Please login first to start your Theory Test.', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 40),
              _buildForm(context),
              const SizedBox(height: 24),
              _buildSignUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email Address', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(hintText: 'Email Address'),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your Email Address';
              }
              if (!AppConstants.emailRegex.hasMatch(value.trim())) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Obx(() => TextFormField(
            controller: controller.passwordController,
            obscureText: !controller.isPasswordVisible.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) return 'Enter your Password';
              if (value.length < 6) return 'Password must be at least 6 characters';
              return null;
            },
          )),
          const SizedBox(height: 16),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Checkbox(
                  value: controller.isChecked.value,
                  onChanged: controller.toggleCheckbox,
                ),
                const Text('Remember Me'),
              ]),
              GestureDetector(
                onTap: () => Get.toNamed(ForgotPasswordScreen.name),
                child: const Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
              ),
            ],
          )),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.login();
                }
              },
              child: const Text('Sign In'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return RichText(
      text: TextSpan(
        text: 'New to Theory Test?',
        style: const TextStyle(color: AppColors.secondaryColor),
        children: [
          TextSpan(
            text: ' Create Account',
            style: const TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(SignUpScreen.name),
          ),
        ],
      ),
    );
  }
}
