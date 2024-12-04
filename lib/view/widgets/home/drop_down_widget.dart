import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String? label;
  final String? value;
  final void Function(String?)? onChanged;
  final List<String> items;

  const DropdownWidget({
    super.key,
    this.label,
    this.value,
    this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGrey600,
                  fontWeight: FontWeight.w500,
                ),
          ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
