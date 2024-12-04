import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveFiltersWidget extends StatelessWidget {
  final Map<String, String> activeFilters;
  final VoidCallback onClearFilter;

  const ActiveFiltersWidget(
      {super.key, required this.activeFilters, required this.onClearFilter});

  @override
  Widget build(BuildContext context) {
    if (activeFilters.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: activeFilters.entries.map((entry) {
            return Chip(
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44)),
              backgroundColor: AppColors.buttonColor,
              labelStyle: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textWhite,
              ),
              label: Text(entry.value),
              onDeleted: onClearFilter,
              deleteIcon: Icon(
                Icons.close,
                size: 14,
                color: AppColors.textWhite,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
