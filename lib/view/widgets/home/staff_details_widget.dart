import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/customer_provider.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaffDetailsWidget extends StatelessWidget {
  const StaffDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.53,
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
                          color: AppColors.appThemeOrange,
                        ),
                        const Spacer(),
                        Text(
                          'Staff details',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 48,
                      color: AppColors.grey.withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              'Staff Name',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textBlack,
                              ),
                            ),
                            const Spacer(),
                            buildActionIcon(
                              icon: 'assets/images/edit.svg',
                              color: AppColors.textGrey600,
                              onTap: () {},
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            buildActionIcon(
                              icon: 'assets/images/delete.svg',
                              color: AppColors.buttonRed,
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    buildContactItem('Password', 'Aru123'),
                    const SizedBox(
                      height: 16,
                    ),
                    buildContactItem('Mobile number', '707070707'),
                    const SizedBox(
                      height: 16,
                    ),
                    buildContactItem('Email ID', '707070707'),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildContactItem('User Type', 'User'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildContactItem('Status', 'Active',
                              valueFontColor: AppColors.textGreen),
                        ),
                      ],
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
              text: 'Done',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
