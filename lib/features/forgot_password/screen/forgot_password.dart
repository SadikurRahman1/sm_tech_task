// import 'package:flutter/material.dart';
// import 'package:sm_tech_task/app/app_constants.dart';
//
// import 'otp_verification_screen.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});
//
//   static const name = '/forgot-password';
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   // get auth service
//
//   // text controllers
//   final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
//   final TextEditingController _emailTEController = TextEditingController();
//
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
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         'Forgot Password',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Enter your email, we will send a verification code to email',
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
//               const SizedBox(height: 24),
//               // Center(child: _buildHaveAccountSection()),
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
//
//           const SizedBox(height: 24),
//           ElevatedButton(onPressed: _onTabNextButton, child: Text('Continue')),
//         ],
//       ),
//     );
//   }
//
//   void _onTabNextButton() {
//     _clearTextFields;
//     if (_fromKey.currentState!.validate()) {
//       Navigator.pushNamed(
//         context,
//         OtpVerificationScreen.name,
//         arguments: _emailTEController.text.trim(),
//       );
//     }
//   }
//
//   void _clearTextFields() {
//     _emailTEController.clear();
//   }
//
//   @override
//   void dispose() {
//     _emailTEController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_constants.dart';
import 'package:sm_tech_task/features/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const name = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    // final controller =  Get.find<ForgotPasswordController>();

    return Scaffold(
      body: SingleChildScrollView(
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Column(
                  children: const [
                    Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enter your email, we will send a verification code to email',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Address',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email can\'t be empty';
                      }
                      if (!AppConstants.emailRegex.hasMatch(value)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.onContinuePressed,
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
