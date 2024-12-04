import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentBlockWidget extends StatelessWidget {
  final String label;
  final String svg;
  final Color color;
  final bool isSelected;

  const PaymentBlockWidget({
    super.key,
    required this.label,
    required this.color,
    required this.isSelected,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? color : AppColors.grey,
        borderRadius: BorderRadius.circular(4),
        // border: Border.all(
        //   color: isSelected ? color : Colors.transparent,
        //   width: 2,
        // ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              SvgPicture.asset(
                svg,
                width: 18,
                height: 18,
                color: isSelected ? AppColors.buttonRed : AppColors.textGrey600,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? AppColors.buttonRed : AppColors.textGrey600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
