import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_colors.dart';
import 'package:sm_tech_task/features/auth/screen/sign_in_screen.dart';
import 'package:sm_tech_task/features/onboarding_splash/data/onboarding_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String name = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void _nextPage() {
    if (currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offNamed(SignInScreen.name); // ✅ GetX navigation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingPages.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final page = onboardingPages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Image
                Image.asset(page.imagePath, height: 280),

                const SizedBox(height: 40),

                // Title
                Text(
                  page.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  page.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                // Page Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingPages.length,
                  effect: const WormEffect(
                    activeDotColor: Colors.blue,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                const SizedBox(height: 24),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    child: Text(
                      currentPage == onboardingPages.length - 1
                          ? 'Get Started'
                          : 'Next',
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
