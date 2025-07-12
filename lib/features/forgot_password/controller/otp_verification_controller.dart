import 'dart:async';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_constants.dart';

class OtpVerificationController extends GetxController {
  late final String email;
  final otpController = ''.obs;
  final remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  final enableResendButton = false.obs;

  late Timer _timer;

  final int adminOtp = 1234;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments ?? '';
    startResendCodeTimer();
  }

  void startResendCodeTimer() {
    enableResendButton.value = false;
    remainingTime.value = AppConstants.resendOtpTimeOutInSecs;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        enableResendButton.value = true;
        timer.cancel();
      }
    });
  }

  void resendCode() {
    startResendCodeTimer();
  }

  bool verifyOtp(String inputOtp) {
    return inputOtp == adminOtp.toString();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
