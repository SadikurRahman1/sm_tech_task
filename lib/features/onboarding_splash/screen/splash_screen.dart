import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/assets_path.dart';
import 'package:sm_tech_task/features/onboarding_splash/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(OnboardingScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),

              // SVG Image
              SvgPicture.asset(AssetsPath.carImage, width: 120, height: 120),

              const SizedBox(height: 24),

              // Title
              const Text(
                'Theory test in my language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Subtitle
              const Text(
                'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),

              const Spacer(),

              // Loading Indicator
              const CircularProgressIndicator(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
