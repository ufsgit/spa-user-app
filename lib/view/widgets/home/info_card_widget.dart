import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;
  final Color backgroundColor;
  final Color textColor;

  const InfoCard({
    super.key,
    required this.imagePath,
    required this.firstText,
    required this.secondText,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Image.asset(imagePath),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                text: firstText,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n$secondText',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
