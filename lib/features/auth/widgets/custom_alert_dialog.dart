// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:sm_tech_task/app/app_colors.dart';
//
// class CustomAlertDialog extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String message;
//   final String buttonText;
//   final Widget nextPageRoute;
//
//   const CustomAlertDialog({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     required this.message,
//     required this.buttonText,
//     required this.nextPageRoute,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Image
//                 SvgPicture.asset(
//                   imagePath,
//                   // width: 120,
//                   height: 150,
//                 ),
//
//                 SizedBox(height: 30),
//
//                 // Title
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600
//                   ),
//                 ),
//
//                 // Text message
//                 Text(
//                   message,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: AppColors.secondaryColor
//                   ),
//                 ),
//
//                 SizedBox(height: 25),
//
//                 // Centered Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       /// ToDo: go to ....
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) => nextPageRoute),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text(buttonText),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Top right Cancel button
//           Positioned(
//             right: 0,
//             top: 0,
//             child: IconButton(
//               icon: Icon(Icons.cancel, color: Colors.grey[700]),
//               onPressed: () {
//                 Navigator.of(context).pop(); // dialog বন্ধ করবে
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';  // <-- GetX import
import 'package:sm_tech_task/app/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String imagePath;
  final String title;
  final String message;
  final String buttonText;
  final Widget nextPageRoute;

  const CustomAlertDialog({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.nextPageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  imagePath,
                  height: 150,
                ),
                SizedBox(height: 30),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.secondaryColor),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      Get.off(() => nextPageRoute);
                      // Get.offAllNamed('/reset-password');

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(Icons.cancel, color: Colors.grey[700]),
              onPressed: () {
                Get.back(); // GetX দিয়ে dialog বন্ধ করবে
              },
            ),
          ),
        ],
      ),
    );
  }
}
