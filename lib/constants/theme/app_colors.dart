import 'package:flutter/material.dart';

class AppColors {
  static Color appThemeOrange = const Color(0xFFE58A2E);
  static Color textGreen = const Color(0xFF5EAB67);
  static Color textGreenBold = const Color(0xFF3F6F47);
  static Color buttonColor = const Color(0xFFD16C04);
  static Color textColor = const Color(0xFF172230);
  static Color textBlack = const Color.fromARGB(255, 0, 0, 0);
  static Color scaffoldBackground = const Color(0xFFF6F7F9);
  static Color buttonRed = const Color(0xFFBD5454);
  static Color textGrey600 = const Color(0xFF7D8B9B);
  static Color textWhite = const Color(0xFFFFFFFF);
  static Color grey = const Color(0xFFE9EDF1);
}

class StatusUtils {
  // Method to get background color based on status
  static Color getStatusColor(int status) {
    switch (status) {
      case 1:
        return const Color(0xFFE5ECFA);
      case 2:
        return const Color(0xFFE8EFE6);
      case 3:
        return const Color(0xFFFCF1E3);
      case 4:
        return const Color(0xFFE7E9F0);
      case 5:
        return const Color(0xFFF2E3E0);
      default:
        return const Color(0xFFE5ECFA);
    }
  }

  // Method to get text color based on status
  static Color getStatusTextColor(int status) {
    switch (status) {
      case 1:
        return const Color(0xFF2349BF);
      case 2:
        return const Color(0xFF407537);
      case 3:
        return const Color(0xFFA4622B);
      case 4:
        return const Color(0xFF293681);
      case 5:
        return const Color(0xFFAE392D);
      default:
        return Colors.grey[700]!;
    }
  }
}
