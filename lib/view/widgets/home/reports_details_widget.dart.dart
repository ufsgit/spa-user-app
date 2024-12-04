import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/customer_provider.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportsDetailsModelSheet extends StatelessWidget {
  const ReportsDetailsModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
                        Column(
                          children: [
                            Text(
                              'Service details',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Service no : 565656',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.textGrey600),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 16,
                          color: AppColors.textGrey600,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '27 Apr 2024',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey600,
                          ),
                        ),
                        Text(
                          ' • ',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey600,
                          ),
                        ),
                        Icon(
                          Icons.access_time_rounded,
                          size: 16,
                          color: AppColors.textGrey600,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '5:00 PM',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey600,
                          ),
                        ),
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
                              'Customer Name',
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
                    buildContactItem('Mobile no', '707070707'),
                    const SizedBox(
                      height: 16,
                    ),
                    buildContactItem('Email ID', '707070707'),
                    const SizedBox(
                      height: 16,
                    ),
                    buildContactItem('Service name', '707070707'),
                    const SizedBox(
                      height: 16,
                    ),
                    buildContactItem('Service Description', '707070707'),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildContactItem(
                              'Service Payment Mode', '707070707'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildContactItem('Service Amount', '707070707',
                              valueFontColor: AppColors.textGreen),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildContactItem(
                            'Tip Payment Mode',
                            '707070707',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildContactItem('Tip Amount', '707070707',
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
