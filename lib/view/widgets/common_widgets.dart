import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget buildActionIcon({
  required String icon,
  required Color color,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
          color: color,
        ),
      ),
    ),
  );
}

Widget buildContactItem(
  String label,
  String value, {
  Color? valueFontColor,
  double? labelFontSize,
  double? valueFontSize,
  FontWeight? labelFontWeight,
  FontWeight? valueFontWeight,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: labelFontSize ?? 14,
          fontWeight: labelFontWeight ?? FontWeight.w500,
          color: AppColors.textGrey600,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: GoogleFonts.plusJakartaSans(
          fontSize: valueFontSize ?? 14,
          fontWeight: valueFontWeight ?? FontWeight.w700,
          color: valueFontColor ?? Colors.black,
        ),
      ),
    ],
  );
}

TextStyle defaultTextStyle(
    {required double fontSize,
    required FontWeight? fontWeight,
    required Color? color}) {
  return GoogleFonts.plusJakartaSans(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

String formatDate(String dateTimeStr) {
  DateTime dateTime = DateTime.parse(dateTimeStr);
  return DateFormat('dd MM yy').format(dateTime);
}

String formatTime(String dateTimeStr) {
  DateTime dateTime = DateTime.parse(dateTimeStr);
  return DateFormat('h:mm a').format(dateTime);
}
