import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/filter_options_provider.dart';
import 'package:spa_app_user/view/widgets/home/custom_drop_down_widget.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterOptionsBottomSheet extends StatelessWidget {
  const FilterOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

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
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/filter.svg',
                              width: 18,
                              height: 18,
                              color: AppColors.appThemeOrange,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Filter',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Date',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Date filter options
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            filterProvider.dateFilterOptions.map((option) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: ChoiceChip(
                              label: Text(option),
                              showCheckmark: false,
                              side: BorderSide(
                                  color: AppColors.textGrey600.withOpacity(.6)),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(26)),
                              selected:
                                  filterProvider.selectedDateFilter == option,
                              onSelected: (bool selected) {
                                if (selected) {
                                  filterProvider.setDateFilter(option);
                                }
                              },
                              selectedColor: AppColors.buttonColor,
                              backgroundColor: AppColors.textWhite,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                    filterProvider.selectedDateFilter == option
                                        ? AppColors.textWhite
                                        : AppColors.textGrey600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Pick a Date',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: HomeTextFieldWidget(
                            onTap: () =>
                                filterProvider.selectDate(context, true),
                            readOnly: true,
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: AppColors.textGrey600.withOpacity(.5),
                            ),
                            showBorder: true,
                            containerColor: AppColors.textWhite,
                            borderColor: AppColors.grey,
                            borderRadius: 8,
                            controller: filterProvider.fromDateController,
                            hintText: 'From',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: HomeTextFieldWidget(
                            onTap: () =>
                                filterProvider.selectDate(context, false),
                            readOnly: true,
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: AppColors.textGrey600.withOpacity(.5),
                            ),
                            showBorder: true,
                            containerColor: AppColors.textWhite,
                            borderColor: AppColors.grey,
                            borderRadius: 8,
                            controller: filterProvider.toDateController,
                            hintText: 'To',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Service/package',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropdownWidget(
                      hintText: "Choose service/package",
                      items: filterProvider.servicePackageList,
                      selectedItem: filterProvider.selectedServicePackage,
                      onChanged: (value) {
                        filterProvider.setServicePackage(value);
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Staff',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropdownWidget(
                      hintText: "Choose Staff",
                      items: filterProvider.staffList,
                      selectedItem: filterProvider.selectedStaff,
                      onChanged: (value) {
                        filterProvider.setStaff(value);
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Payment type',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropdownWidget(
                      hintText: "Choose Payment type",
                      items: filterProvider.paymentTypeList,
                      selectedItem: filterProvider.selectedPaymentType,
                      onChanged: (value) {
                        filterProvider.setPaymentType(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Expanded(
                //   child: CustomButtonWidget(
                //     color: Colors.white,
                //     width: MediaQuery.sizeOf(context).width,
                //     style: GoogleFonts.plusJakartaSans(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600,
                //       color: AppColors.appThemeOrange,
                //     ),
                //     shape: ContinuousRectangleBorder(
                //       borderRadius: BorderRadius.circular(24),
                //       side: BorderSide(color: AppColors.appThemeOrange),
                //     ),
                //     text: 'Reset',
                //     onPressed: () {
                //       filterProvider.resetFilters();
                //     },
                //   ),
                // ),
                // const SizedBox(width: 16),
                Expanded(
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
                    text: 'Apply',
                    onPressed: () {
                      filterProvider.applyFilters();
                      Navigator.pop(
                          context); // Optional: close bottom sheet after applying
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
