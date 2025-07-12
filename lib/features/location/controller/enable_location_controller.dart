import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/features/location/screen/select_language_screen.dart';

class EnableLocationController extends GetxController {
  Future<void> requestLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showMessage(context, 'Location services are disabled. Please enable them.');
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showMessage(context, 'Location permission denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showMessage(context, 'Location permission permanently denied. Open settings.');
      await Geolocator.openAppSettings();
      return;
    }

    Get.toNamed(SelectLanguageScreen.name);
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
