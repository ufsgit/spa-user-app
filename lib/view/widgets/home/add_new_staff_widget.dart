import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/customer_provider.dart';
import 'package:spa_app_user/view/widgets/home/custom_drop_down_widget.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewStaffWidget extends StatelessWidget {
  const AddNewStaffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    List<String> staffList = ["Staff 1", "Staff 2", "Staff 3"];
    List<String> servicesList = ["Service 1", "Service 2", "Service 3"];
    List<String> paymentMethods = ["Credit Card", "Cash", "UPI"];

    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
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
                          'Add new staff',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 16),
                    HomeTextFieldWidget(
                      borderRadius: 8,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      controller: customerProvider.mobileNoController,
                      hintText: 'Staff name',
                    ),
                    const SizedBox(height: 16),
                    HomeTextFieldWidget(
                      borderRadius: 8,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      controller: customerProvider.emailIdController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownWidget(
                      hintText: "Mobile Number",
                      items: staffList,
                      selectedItem: customerProvider.selectedStaff,
                      onChanged: (value) {
                        customerProvider.setSelectedStaff(value);
                      },
                    ),
                    const SizedBox(height: 16),
                    HomeTextFieldWidget(
                      showBorder: true,
                      containerColor: AppColors.textWhite,
                      borderColor: AppColors.grey,
                      borderRadius: 8,
                      controller: customerProvider.amountController,
                      hintText: 'Email ID',
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Allow App Login",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Grant mobile app access for this user",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textGrey600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: .7,
                          child: Switch(
                            trackOutlineColor:
                                WidgetStatePropertyAll(AppColors.textWhite),
                            activeColor: AppColors.textWhite,
                            activeTrackColor: AppColors.appThemeOrange,
                            inactiveThumbColor: AppColors.textWhite,
                            inactiveTrackColor:
                                AppColors.textGrey600.withOpacity(.5),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: customerProvider.isTipEnabled,
                            onChanged: (value) {
                              customerProvider.setTipEnabled(value);
                            },
                          ),
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
              text: 'Add User',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
