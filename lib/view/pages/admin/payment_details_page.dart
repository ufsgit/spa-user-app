import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/model/dash_board_model.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:spa_app_user/view/widgets/home/back_button_widget.dart';
import 'package:spa_app_user/view/widgets/home/customer_transaction_widget.dart';
import 'package:spa_app_user/view/widgets/home/filtered_bottom_sheet.dart';
import 'package:spa_app_user/view/widgets/home/heading_widget.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key, required this.dashBoardData});
  final List<Datum>? dashBoardData;
  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => FilterOptionsBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const HeadingWidget(text: 'Cash Payment Details'),
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
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: dashBoardData!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustomerTransactionWidget(
                      staffName: dashBoardData![index].toUserName,
                      time: formatTime(dashBoardData![index].date.toString()),
                      date: formatDate(dashBoardData![index].date.toString()),
                      customer: dashBoardData![index].customerName,
                      service: dashBoardData![index].packageName,
                      amount:
                          '₹${double.parse(dashBoardData![index].packageAmount)}\n(${dashBoardData![index].paymentModeName})',
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
