import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  final RxString selectedLanguageCode = ''.obs;

  void selectLanguage(String code) {
    selectedLanguageCode.value = code;
  }

  bool isSelected(String code) {
    return selectedLanguageCode.value == code;
  }

  bool get isContinueEnabled => selectedLanguageCode.isNotEmpty;
}
