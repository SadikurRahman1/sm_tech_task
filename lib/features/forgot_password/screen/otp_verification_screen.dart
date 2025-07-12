// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:sm_tech_task/app/app_colors.dart';
// import 'package:sm_tech_task/app/app_constants.dart';
// import 'package:sm_tech_task/features/forgot_password/screen/reset_password_screen.dart';
//
// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key, required this.email});
//
//   static const name = '/otp-verification';
//   final String email;
//
//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final TextEditingController _otpTEController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
//   late Timer timer;
//   final RxBool _enableResendOtpButton = false.obs;
//
//   final int adminOtp = 1234;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _startResendCode();
//   }
//
//   void _startResendCode() {
//     _enableResendOtpButton.value = false;
//     _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
//     timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       _remainingTime.value--;
//       if (_remainingTime.value == 0) {
//         t.cancel();
//         _enableResendOtpButton.value = true;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const SizedBox(height: 80),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           'Verify Code',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Please enter the code we just sent to email ${widget.email}',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: 280,
//                   child: PinCodeTextField(
//                     controller: _otpTEController,
//                     appContext: context,
//                     length: 4,
//                     obscureText: false,
//                     animationType: AnimationType.fade,
//                     animationDuration: const Duration(milliseconds: 300),
//                     keyboardType: TextInputType.number,
//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.box,
//                       // selectedFillColor: Colors.green,
//                       activeColor: AppColors.themeColor,
//                       inactiveColor: AppColors.themeColor,
//                       borderRadius: BorderRadius.circular(8),
//                       fieldWidth: 50,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 ElevatedButton(
//                   onPressed: _onTapNextButton,
//
//                   child: const Text('Next'),
//                 ),
//                 const SizedBox(height: 24),
//                 Obx(
//                   () => Visibility(
//                     visible: !_enableResendOtpButton.value,
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'This code Will be expire in',
//                         style: const TextStyle(color: Colors.grey),
//                         children: [
//                           TextSpan(
//                             text: '${_remainingTime}s',
//                             style: const TextStyle(color: AppColors.themeColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Obx(
//                   () => Visibility(
//                     visible: _enableResendOtpButton.value,
//                     child: TextButton(
//                       onPressed: () {
//                         _startResendCode();
//                       },
//                       child: const Text('Resend code in '),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _onTapNextButton() async {
//     if (_formKey.currentState!.validate()) {
//       final int otp = int.parse(_otpTEController.text.trim());
//       if (otp == adminOtp) {
//         if (mounted) {
//           Navigator.pushNamed(context, ResetPasswordScreen.name);
//         }
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     timer.cancel();
//   }
// }
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
    // final controller =  Get.find<OtpVerificationController>();


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
