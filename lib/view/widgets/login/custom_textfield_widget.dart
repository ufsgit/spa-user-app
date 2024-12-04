import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';


class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;
  final double? height;
  final Color? borderColor;
  final Color? fillColor;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.suffixIcon,
    this.height,
    this.borderColor, this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
      
        
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.textBlack, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 26,horizontal: 15),
      filled: true,
      fillColor: fillColor??Colors.white,
          hintText: hintText,
          
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textGrey600, fontWeight: FontWeight.w700),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: borderColor ?? Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor ??Colors.white, width: 2),
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }
}
