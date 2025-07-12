// import 'package:flutter/material.dart';
// import 'package:sm_tech_task/app/assets_path.dart';
// import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';
//
// import '../../auth/widgets/custom_alert_dialog.dart';
//
// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});
//
//   static const name = '/reset-password';
//
//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }
//
// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   // get auth service
//
//   // text controllers
//   final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
//   final TextEditingController _NewPasswordTEController =
//       TextEditingController();
//   final TextEditingController _confirmPasswordTEController =
//       TextEditingController();
//
//   bool _isPasswordVisible = false;
//   bool _inProgress = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // TextTheme textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40),
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.grey.shade200,
//                 ),
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
//                   onPressed: _onTabSgnInForm,
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         'Reset Password',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Your password must be at least 8 characters long and include a combination of letters, numbers',
//                         textAlign: TextAlign.center,
//                         // ← টেক্সট সেন্টার লাইনে বসবে
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//               _buildSignInForm(),
//             ],
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
//             'New Password',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//           TextFormField(
//             controller: _NewPasswordTEController,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: const InputDecoration(hintText: 'Password'),
//             validator: (String? value) {
//               if (value == null || value.isEmpty) {
//                 return 'Password can\'t be empty';
//               } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
//                 return 'Password must contain at least one uppercase letter';
//               } else if (!RegExp(r'[a-z]').hasMatch(value)) {
//                 return 'Password must contain at least one lowercase letter';
//               } else if (!RegExp(r'[0-9]').hasMatch(value)) {
//                 return 'Password must contain at least one number';
//               } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
//                 return 'Password must contain at least one special character (!@#\$&*~)';
//               } else if (value.length < 6) {
//                 return 'Password must be at least 6 characters long';
//               }
//               return null;
//             },
//           ),
//
//           const SizedBox(height: 8),
//
//           Text(
//             'Confirm New Password',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//
//           TextFormField(
//             obscureText: !_isPasswordVisible,
//             controller: _confirmPasswordTEController,
//             keyboardType: TextInputType.emailAddress,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible
//                       ? Icons.visibility_off_outlined
//                       : Icons.visibility_outlined,
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
//               } else if (value.length < 6) {
//                 return 'Password must be at least 6 characters long';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(onPressed: _onTabNextButton, child: Text('Submit')),
//         ],
//       ),
//     );
//   }
//
//   void _onTabNextButton() {
//     if (_fromKey.currentState!.validate()) {
//       _signUp();
//     }
//   }
//
//   Future<void> _signUp() async {
//     final password = _NewPasswordTEController.text;
//     final confirmPassword = _confirmPasswordTEController.text;
//
//     // check the password match
//     if (password == confirmPassword) {
//       _clearTextFields;
//       showDialog(
//         context: context,
//         builder:
//             (_) => CustomAlertDialog(
//               imagePath: AssetsPath.listImage,
//               title: 'Success',
//               message: 'Your password is succesfully created',
//               buttonText: 'Continue',
//               nextPageRoute: EnableLocationScreen(),
//             ),
//       );
//
//       return;
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Password don't match")));
//     }
//   }
//
//   void _clearTextFields() {
//     _NewPasswordTEController.clear();
//     _confirmPasswordTEController.clear();
//   }
//
//   void _onTabSgnInForm() {
//     Navigator.pop(context);
//   }
//
//   @override
//   void dispose() {
//     _NewPasswordTEController.dispose();
//     _confirmPasswordTEController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/features/forgot_password/controller/reset_password_controller.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  static const name = '/reset-password';

  final ResetPasswordController controller = Get.put(ResetPasswordController());
  // final ResetPasswordController controller = Get.find<ResetPasswordController>();

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
