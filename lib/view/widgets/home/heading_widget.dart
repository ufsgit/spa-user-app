import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  const HeadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textBlack),
    );
  }
}
