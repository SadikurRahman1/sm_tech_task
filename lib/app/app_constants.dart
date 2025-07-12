class AppConstants{
  static const int resendOtpTimeOutInSecs = 120;


  static var mobileRegex = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
  static var emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
}