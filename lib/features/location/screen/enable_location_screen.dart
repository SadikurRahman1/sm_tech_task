import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_colors.dart';
import 'package:sm_tech_task/app/assets_path.dart';
import 'package:sm_tech_task/features/location/controller/enable_location_controller.dart';
import 'package:sm_tech_task/features/location/screen/select_language_screen.dart';

class EnableLocationScreen extends StatelessWidget {
  EnableLocationScreen({super.key});

  static const String name = '/enable-location';

  final controller = Get.put(EnableLocationController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitDialog(context);
        return false; // Prevent default back
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SvgPicture.asset(AssetsPath.mapsImage, width: 120, height: 120),

                const SizedBox(height: 30),

                const Text(
                  'Enable Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.requestLocationPermission(context),
                    child: const Text('Enable'),
                  ),
                ),

                const SizedBox(height: 24),

                TextButton(
                  onPressed: () {
                    Get.toNamed(SelectLanguageScreen.name);
                  },
                  child: const Text(
                    'Skip, Not Now',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.exit_to_app, size: 48, color: AppColors.themeColor),
                const SizedBox(height: 16),
                const Text(
                  'Exit App?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                 Text(
                  'Are you sure you want to exit the app?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.secondaryColor),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button (smaller padding)
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Exit Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        SystemNavigator.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        'Exit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
