import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onChanged;

  const CustomDropdownWidget({super.key, 
    required this.hintText,
    required this.items,
    this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        hint: Text(
          hintText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textGrey600, fontWeight: FontWeight.w400),
        ),
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.textGrey600.withOpacity(0.5),
        ),
        iconSize: 24,
        underline: const SizedBox(),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textBlack, fontWeight: FontWeight.w700),
            ),
          );
        }).toList(),
      ),
    );
  }
}
