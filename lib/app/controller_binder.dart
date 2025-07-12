

import 'package:get/get.dart';
import 'package:sm_tech_task/features/forgot_password/controller/forgot_password_controller.dart';
import 'package:sm_tech_task/features/forgot_password/controller/reset_password_controller.dart';
import 'package:sm_tech_task/features/location/controller/select_language_controller.dart';
import 'package:sm_tech_task/features/forgot_password/controller/otp_verification_controller.dart';
import 'package:sm_tech_task/features/auth/controller/sign_in_controller.dart';
import 'package:sm_tech_task/features/auth/controller/sign_up_controller.dart';
import 'package:sm_tech_task/features/location/controller/enable_location_controller.dart';
// আরও যেসব controller আছে সব এখানে import করে নাও

class ControllerBinder extends Bindings {
  @override
  void dependencies() {

    // OTP Verification Controller
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController());
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());

    // Auth Controllers
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());

    // Enable Location Controller
    Get.lazyPut<EnableLocationController>(() => EnableLocationController());
    Get.lazyPut<SelectLanguageController>(() => SelectLanguageController());
    // অন্য কোনো controller থাকলে এখানেই যোগ করো



  }
}
