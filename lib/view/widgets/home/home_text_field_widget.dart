import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? borderRadius;
  final bool? readOnly;
  final Color? borderColor;
  final Color? containerColor;
  final bool showBorder;
  final void Function()? onTap;

  const HomeTextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.maxLines = 1,
      this.suffixIcon,
      this.height,
      this.borderColor,
      this.prefixIcon,
      this.containerColor = Colors.white,
      this.showBorder = false,
      this.borderRadius = 16,
      this.onTap,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 5, color: AppColors.grey)],
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: showBorder
            ? Border.all(color: borderColor ?? AppColors.textGrey600)
            : null,
      ),
      height: height,
      child: TextField(
        onTap: onTap,
        readOnly: readOnly!,
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.textBlack, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          prefixIcon: prefixIcon,
          labelText: hintText,
          labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textGrey600, fontWeight: FontWeight.w400),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }
}
