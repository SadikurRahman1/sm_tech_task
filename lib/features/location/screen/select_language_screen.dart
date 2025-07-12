// import 'package:flutter/material.dart';
// import 'package:sm_tech_task/app/app_colors.dart';
// import 'package:sm_tech_task/features/location/data/language_data.dart';
//
// class SelectLanguageScreen extends StatefulWidget {
//   const SelectLanguageScreen({super.key});
//
//   static const name = '/select-language';
//
//   @override
//   State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
// }
//
// class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
//   String? selectedLanguageCode;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.grey.shade200,
//                 ),
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               const Text(
//                 'What is Your Mother Language',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//               ),
//
//               const SizedBox(height: 8),
//
//               const Text(
//                 'Discover what is a podcast description and podcast summary.',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//
//               const SizedBox(height: 30),
//
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: languageList.length,
//                   separatorBuilder: (_, __) => const Divider(),
//                   itemBuilder: (context, index) {
//                     final lang = languageList[index];
//                     final isSelected = selectedLanguageCode == lang.code;
//
//                     return Row(
//                       children: [
//                         // Flag
//                         Text(lang.flagEmoji, style: const TextStyle(fontSize: 24)),
//                         const SizedBox(width: 12),
//
//                         // Language Name
//                         Expanded(
//                           child: Text(
//                             lang.country,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//
//                         // Select Button
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               selectedLanguageCode = lang.code;
//                             });
//                           },
//                           style: TextButton.styleFrom(
//                             backgroundColor: isSelected ? AppColors.themeColor : null,
//                             foregroundColor: isSelected ? Colors.white : Colors.blue,
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                           ),
//                           child: Text(isSelected ? 'Selected' : 'Select'),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//
//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: selectedLanguageCode == null
//                       ? null
//                       : () {
//                     // Navigator.pushNamed(context, EnableLocationScreen.name);
//                     ///ToDo: go to the next screen
//                   },
//                   child: const Text('Continue'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_tech_task/app/app_colors.dart';
import 'package:sm_tech_task/features/location/controller/select_language_controller.dart';
import 'package:sm_tech_task/features/location/data/language_data.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});
  static const name = '/select-language';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLanguageController>(
      init: SelectLanguageController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'What is Your Mother Language',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Discover what is a podcast description and podcast summary.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 30),

                  // Language List
                  Expanded(
                    child: ListView.separated(
                      itemCount: languageList.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final lang = languageList[index];
                        final isSelected = controller.selectedLanguageCode.value == lang.code;

                        return Row(
                          children: [
                            Text(lang.flagEmoji, style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                lang.country,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.selectLanguage(lang.code);
                                controller.update(); // <- update UI
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: isSelected ? AppColors.themeColor : null,
                                foregroundColor: isSelected ? Colors.white : Colors.blue,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              ),
                              child: Text(isSelected ? 'Selected' : 'Select'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isContinueEnabled
                          ? () {
                        Get.defaultDialog(
                          title: "Complete UI",
                          middleText: "You Selected Language: ${controller.selectedLanguageCode.value}",
                          textConfirm: "OK",
                          titleStyle: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            Get.back(); // dialog বন্ধ করতে
                          },
                        );
                      }
                          : null,
                      child: const Text('Continue'),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
