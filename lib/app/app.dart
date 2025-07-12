// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:sm_tech_task/features/auth/screen/sign_up_screen.dart';
// import 'package:sm_tech_task/features/forgot_password/screen/forgot_password.dart';
// import 'package:sm_tech_task/features/forgot_password/screen/reset_password_screen.dart';
// import 'package:sm_tech_task/features/location/screen/enable_location_screen.dart';
// import 'package:sm_tech_task/features/location/screen/select_language_screen.dart';
// import 'package:sm_tech_task/features/onboarding_splash/screen/onboarding_screen.dart';
// import 'package:sm_tech_task/features/onboarding_splash/screen/splash_screen.dart';
// import 'package:sm_tech_task/features/auth/screen/sign_in_screen.dart';
// import 'package:sm_tech_task/features/forgot_password/screen/otp_verification_screen.dart';
// import 'app_theme_data.dart';
// import 'controller_binder.dart';
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: AppThemeData.lightThemeData,
//       darkTheme: AppThemeData.darkThemeData,
//       themeMode: ThemeMode.light,
//       initialBinding: ControllerBinder(),
//       initialRoute: '/',
//       onGenerateRoute: (RouteSettings settings) {
//         late Widget widget;
//         if (settings.name == SplashScreen.name) {
//           widget = const SplashScreen();
//         }if (settings.name == OnboardingScreen.name) {
//           widget = const OnboardingScreen();
//         } else if (settings.name == SignInScreen.name) {
//           widget = const SignInScreen();
//         } else if (settings.name == SignUpScreen.name) {
//           widget = const SignUpScreen();
//         } else if (settings.name == ForgotPasswordScreen.name) {
//           widget = const ForgotPasswordScreen();
//         } else if (settings.name == OtpVerificationScreen.name) {
//           String email = settings.arguments as String;
//           widget = OtpVerificationScreen(email: email);
//         } else if (settings.name == ResetPasswordScreen.name) {
//           widget = const ResetPasswordScreen();
//         } else if (settings.name == EnableLocationScreen.name) {
//           widget = const EnableLocationScreen();
//         } else if (settings.name == SelectLanguageScreen.name) {
//           widget = const SelectLanguageScreen();
//         }
//
//         return MaterialPageRoute(
//           builder: (ctx) {
//             return widget;
//           },
//         );
//       },
//     );
//   }
// }
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
        GetPage(name: OnboardingScreen.name, page: () => const OnboardingScreen()),
        GetPage(name: SignInScreen.name, page: () =>  SignInScreen()),
        GetPage(name: SignUpScreen.name, page: () => const SignUpScreen()),
        GetPage(name: ForgotPasswordScreen.name, page: () => const ForgotPasswordScreen()),
        GetPage(
          name: OtpVerificationScreen.name,
          page: () => OtpVerificationScreen(),
        ),
        // GetPage(
        //   name: OtpVerificationScreen.name,
        //   page: () {
        //     final email = Get.arguments as String? ?? '';
        //     return OtpVerificationScreen(email: email);
        //   },
        // ),
        GetPage(name: ResetPasswordScreen.name, page: () =>  ResetPasswordScreen()),
        GetPage(name: EnableLocationScreen.name, page: () =>  EnableLocationScreen()),
        GetPage(name: SelectLanguageScreen.name, page: () =>  SelectLanguageScreen()),
      ],
    );
  }
}
