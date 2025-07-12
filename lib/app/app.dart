import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sm_tech_task/features/auth/screen/sign_in_screen.dart';
import 'package:sm_tech_task/features/auth/screen/sign_up_screen.dart';
import 'package:sm_tech_task/features/forgot_password/screen/forgot_password.dart';
import 'package:sm_tech_task/features/forgot_password/screen/otp_verification_screen.dart';
import 'package:sm_tech_task/features/forgot_password/screen/reset_password_screen.dart';
import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';
import 'package:sm_tech_task/features/location/screen/select_language_screen.dart';
import 'package:sm_tech_task/features/onboarding_splash/screen/onboarding_screen.dart';
import 'package:sm_tech_task/features/onboarding_splash/screen/splash_screen.dart';

import 'app_theme_data.dart';
import 'controller_binder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      initialRoute: SplashScreen.name,
      getPages: [
        GetPage(name: SplashScreen.name, page: () => const SplashScreen()),
        GetPage(
          name: OnboardingScreen.name,
          page: () => const OnboardingScreen(),
        ),
        GetPage(name: SignInScreen.name, page: () => SignInScreen()),
        GetPage(name: SignUpScreen.name, page: () => const SignUpScreen()),
        GetPage(
          name: ForgotPasswordScreen.name,
          page: () => const ForgotPasswordScreen(),
        ),
        GetPage(
          name: OtpVerificationScreen.name,
          page: () => OtpVerificationScreen(),
        ),
        GetPage(
          name: ResetPasswordScreen.name,
          page: () => ResetPasswordScreen(),
        ),
        GetPage(
          name: EnableLocationScreen.name,
          page: () => EnableLocationScreen(),
        ),
        GetPage(
          name: SelectLanguageScreen.name,
          page: () => SelectLanguageScreen(),
        ),
      ],
    );
  }
}
