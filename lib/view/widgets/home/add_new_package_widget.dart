import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AddNewPackageWidget extends StatelessWidget {
  final bool isEdit;
  const AddNewPackageWidget({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                          color: AppColors.textGrey600,
                        ),
                        const Spacer(),
                        Text(
                          isEdit
                              ? 'Edit new service / Package'
                              : 'Add new service / Package',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 24),
                    HomeTextFieldWidget(
                      showBorder: true,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      borderRadius: 8,
                      controller: TextEditingController(),
                      hintText: 'Service/Package name',
                    ),
                    const SizedBox(height: 16),
                    HomeTextFieldWidget(
                      borderRadius: 8,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      controller: TextEditingController(),
                      hintText: 'Price',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButtonWidget(
              color: AppColors.appThemeOrange,
              width: MediaQuery.sizeOf(context).width,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textWhite,
              ),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              text: isEdit ? 'Edit customer' : 'Add customer',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
