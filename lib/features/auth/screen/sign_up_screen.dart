// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:sm_tech_task/app/app_colors.dart';
// import 'package:sm_tech_task/app/app_constants.dart';
// import 'package:sm_tech_task/app/assets_path.dart';
// import 'package:sm_tech_task/features/auth/widgets/custom_alert_dialog.dart';
// import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   static const name = '/sign-up';
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   // get auth service
//
//   // text controllers
//   final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
//   final TextEditingController _fullNameEController = TextEditingController();
//   final TextEditingController _emailTEController = TextEditingController();
//   final TextEditingController _passwordTEController = TextEditingController();
//
//   bool _isPasswordVisible = false;
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
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey.shade200,
//                   ),
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//
//                 const SizedBox(height: 30),
//                 Text(
//                   'Welcome to Eduline',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                 ),
//                 const SizedBox(height: 40),
//                 _buildSignInForm(),
//                 const SizedBox(height: 24),
//                 Center(child: _buildHaveAccountSection()),
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
//       key: _fromKey,
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
//             decoration: const InputDecoration(hintText: 'Email'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Email can\'n be empty';
//               }
//               if (AppConstants.emailRegex.hasMatch(value!) == false) {
//                 //use regex
//                 return 'Enter your valid Email';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Full Name',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//           TextFormField(
//             controller: _fullNameEController,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: const InputDecoration(hintText: 'Name'),
//             validator: (String? value) {
//               if (value?.isEmpty ?? true) {
//                 return 'Enter Name';
//               }
//               return null;
//             },
//           ),
//
//           const SizedBox(height: 8),
//
//           Text(
//             'Password',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//
//           TextFormField(
//             obscureText: !_isPasswordVisible,
//             controller: _passwordTEController,
//             keyboardType: TextInputType.emailAddress,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (String? value) {
//               if (value == null || value.isEmpty) {
//                 return 'Password can\'t be empty';
//                 } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
//                   return 'Password must contain at least one uppercase letter';
//                 } else if (!RegExp(r'[a-z]').hasMatch(value)) {
//                   return 'Password must contain at least one lowercase letter';
//                 } else if (!RegExp(r'[0-9]').hasMatch(value)) {
//                   return 'Password must contain at least one number';
//                 } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
//                   return 'Password must contain at least one special character (!@#\$&*~)';
//               } else if (value.length < 6) {
//                 return 'Password must be at least 6 characters long';
//               }
//               return null;
//             },
//           ),
//
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: _onTabNextButton,
//             child: Text('Label')
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHaveAccountSection() {
//     return RichText(
//       text: TextSpan(
//         text: "Already have an account?",
//         style: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w600,
//           letterSpacing: 0.5,
//         ),
//         children: [
//           TextSpan(
//             text: ' Sign In',
//             style: const TextStyle(color: AppColors.themeColor),
//             recognizer: TapGestureRecognizer()..onTap = _onTabSgnInForm,
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onTabNextButton() {
//     if (_fromKey.currentState!.validate()) {
//       _clearTextFields();
//       showDialog(
//         context: context,
//         builder: (_) => CustomAlertDialog(
//           imagePath: AssetsPath.successImage,    // তোমার ইমেজের পাথ
//           title: 'Successfully Registered',
//           message: 'Your account has been registered successfully, now let’s enjoy our features!',
//           buttonText: 'Continue',
//           nextPageRoute: EnableLocationScreen(),
//         ),
//       );
//     }
//   }
//
//
//   void _clearTextFields() {
//     _emailTEController.clear();
//     _fullNameEController.clear();
//     _passwordTEController.clear();
//   }
//
//   void _onTabSgnInForm() {
//     Navigator.pop(context);
//   }
//
//   @override
//   void dispose() {
//     _emailTEController.dispose();
//     _fullNameEController.dispose();
//     _passwordTEController.dispose();
//     super.dispose();
//   }
// }
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
    // final controller = Get.find<SignUpController>();

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
