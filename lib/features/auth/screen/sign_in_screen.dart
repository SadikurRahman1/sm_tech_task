// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:sm_tech_task/app/app_colors.dart';
// import 'package:sm_tech_task/app/app_constants.dart';
// import 'package:sm_tech_task/app/assets_path.dart';
// import 'package:sm_tech_task/features/auth/screen/sign_up_screen.dart';
// import 'package:sm_tech_task/features/forgot_password/screen/forgot_password.dart';
// import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});
//
//   static const name = '/sign-in';
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   final _emailTEController = TextEditingController();
//   final _passwordTEController = TextEditingController();
//
//   bool _isPasswordVisible = false;
//   bool isChecked = false;
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // TextTheme textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(
//                   AssetsPath.bookImage,
//                   width: 80, // প্রয়োজনে আকার নির্ধারণ করো
//                   height: 80,
//                 ),
//                 const SizedBox(height: 30),
//                 Text(
//                   'Welcome Back!',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Please login first to start your Theory Test.',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                 ),
//
//                 const SizedBox(height: 40),
//                 _buildSignInForm(),
//
//                 const SizedBox(height: 24),
//                 Center(child: _buildSignUpSection()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSignInForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Email Address',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//           TextFormField(
//             controller: _emailTEController,
//             keyboardType: TextInputType.emailAddress,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: const InputDecoration(hintText: 'Email Address'),
//             validator: (String? value) {
//               if (value?.trim().isEmpty ?? true) {
//                 return 'Enter your Email Address';
//               }
//               if (AppConstants.emailRegex.hasMatch(value!) == false) {
//                 //use regex
//                 return 'Enter your valid email address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Password',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//           TextFormField(
//             obscureText: !_isPasswordVisible,
//             controller: _passwordTEController,
//             keyboardType: TextInputType.emailAddress,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (String? value) {
//               if (value?.isEmpty ?? true) {
//                 return 'Enter your Password';
//               }
//               if (value!.length < 6) {
//                 return 'Enter a password more then 6 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Checkbox(
//                     value: isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = value!;
//                       });
//                     },
//                   ),
//                   Text(
//                     'Remember Me',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: _onTabForgotPassword,
//                 child: Text(
//                   'Forgot Password?',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           ElevatedButton(
//             onPressed: _onTabNextButton,
//             child: const Text('Sign In'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSignUpSection() {
//     return RichText(
//       text: TextSpan(
//         text: "New to Theory Test?",
//         style: const TextStyle(
//           color: AppColors.secondaryColor,
//           fontWeight: FontWeight.w600,
//           letterSpacing: 0.5,
//         ),
//         children: [
//           TextSpan(
//             text: ' Create Account',
//             style: const TextStyle(color: AppColors.themeColor),
//             recognizer: TapGestureRecognizer()..onTap = _onTabCreateANewAccount,
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onTabForgotPassword() {
//     Navigator.pushNamed(context, ForgotPasswordScreen.name);
//   }
//
//   Future login() async {
//     final email = _emailTEController.text.trim();
//     final password = _passwordTEController.text.trim();
//
//     final adminEmail = "admin@gmail.com";
//     final adminPassword = "Admin@123";
//
//     if (email == adminEmail && password == adminPassword) {
//       /// TODO:  Login success, go to dashboard
//       _clearTextFields;
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, EnableLocationScreen.name);
//       }
//     } else {
//       // Login failed
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Login failed. Please try again.')),
//         );
//       }
//     }
//   }
//
//   void _onTabNextButton() {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }
//     login();
//   }
//
//   void _onTabCreateANewAccount() {
//     Navigator.pushNamed(context, SignUpScreen.name);
//   }
//
//   void _clearTextFields() {
//     _emailTEController.clear();
//     _passwordTEController.clear();
//   }
//
//   @override
//   void dispose() {
//     _emailTEController.dispose();
//     _passwordTEController.dispose();
//     super.dispose();
//   }
// }
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
