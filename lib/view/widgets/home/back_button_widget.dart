import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  const BackButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/arrow_back.svg',
            color: AppColors.appThemeOrange,
          ),
        ),
      ),
    );
  }
}
