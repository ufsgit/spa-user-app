import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/filter_options_provider.dart';
import 'package:spa_app_user/view/widgets/home/active_filters_widget.dart';
import 'package:spa_app_user/view/widgets/home/customer_transaction_widget.dart';
import 'package:spa_app_user/view/widgets/home/filtered_bottom_sheet.dart';
import 'package:spa_app_user/view/widgets/home/heading_widget.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:spa_app_user/view/widgets/home/reports_details_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  void showCustomerDetails(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => ReportsDetailsModelSheet());
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => FilterOptionsBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BackButtonWidget(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                const HeadingWidget(text: 'Reports'),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: HomeTextFieldWidget(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: AppColors.textGrey600.withOpacity(.5),
                          size: 24,
                        ),
                        height: 38,
                        controller: TextEditingController(),
                        hintText: 'Search',
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        showFilterBottomSheet(context);
                      },
                      child: Container(
                        width: 70,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.textWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/filter.svg',
                                width: 25,
                                height: 25,
                                color: AppColors.textGrey600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ActiveFiltersWidget(
                  activeFilters: filterProvider.activeFilters,
                  onClearFilter: () {
                    filterProvider.resetFilters();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    showCustomerDetails(context);
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomerTransactionWidget(
                        date: '17 Apr, 2024',
                        customer: 'Customer 1',
                        service: 'service',
                        amount: '2333',
                        time: '5:00 PM',
                        staffName: 'staffName',
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
