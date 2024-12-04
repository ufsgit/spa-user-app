import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/admin_dashboard_provider.dart';
import 'package:spa_app_user/controller/login/login_provider.dart';
import 'package:spa_app_user/view/pages/admin/bottom_navigation_screen.dart';
import 'package:spa_app_user/view/pages/admin/payment_details_page.dart';
import 'package:spa_app_user/view/pages/admin/settings_page.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:spa_app_user/view/widgets/home/customer_transaction_widget.dart';
import 'package:spa_app_user/view/widgets/home/info_card_widget.dart';
import 'package:spa_app_user/view/widgets/home/payment_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dashboardProvider =
          Provider.of<DashboardProvider>(context, listen: false);

      await dashboardProvider.fetchAllItems();

      if (dashboardProvider.isItemsFetched) {
        String startDate;
        String endDate;

        DateTime now = DateTime.now();
        if (dashboardProvider.selectedTimeFrame == 'Monthly') {
          startDate = DateTime(now.year, now.month, 1)
              .toIso8601String()
              .split('T')
              .first;
          endDate = DateTime(now.year, now.month + 1, 0)
              .toIso8601String()
              .split('T')
              .first;
        } else if (dashboardProvider.selectedTimeFrame == 'Weekly') {
          DateTime startOfWeek =
              now.subtract(Duration(days: now.weekday)); // Sunday
          DateTime endOfWeek =
              startOfWeek.add(const Duration(days: 6)); // Saturday
          startDate = startOfWeek.toIso8601String().split('T').first;
          endDate = endOfWeek.toIso8601String().split('T').first;
        } else {
          // 'Today'
          startDate = now.toIso8601String().split('T').first;
          endDate = startDate; // Same day
        }
        dashboardProvider.fetchDashBoardDetails(
          startDate: startDate,
          endDate: endDate,
          paymentModeId: dashboardProvider.selectedPaymentId!,
          toUserId: dashboardProvider.selectedUser!,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final dashboardProvider = Provider.of<DashboardProvider>(context);

  
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 230,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg_image.png'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 38,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(32),
                              color: AppColors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColors.grey.withOpacity(.3),
                                    foregroundColor: Colors.transparent,
                                    radius: 13,
                                    backgroundImage:
                                        const AssetImage('assets/images/user.png'),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    userData['name']??"",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textWhite),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/spa_logo.png',
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Indulge in',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey.withOpacity(.5),
                              ),
                            ),
                            TextSpan(
                              text: '\nPure Relaxation',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Visit and Payment Overview',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack,
                          ),
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.textGrey600.withOpacity(.4)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: DropdownButton<String>(
                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                              value: dashboardProvider.selectedTimeFrame,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  // Update selected time frame
                                  dashboardProvider
                                      .updateSelectedTimeFrame(newValue);

                                  // Get the start and end dates based on selected time frame
                                  String startDate;
                                  String endDate;

                                  DateTime now = DateTime.now();
                                  if (newValue == 'Monthly') {
                                    startDate = DateTime(now.year, now.month, 1)
                                        .toIso8601String()
                                        .split('T')
                                        .first;
                                    endDate =
                                        DateTime(now.year, now.month + 1, 0)
                                            .toIso8601String()
                                            .split('T')
                                            .first;
                                  } else if (newValue == 'Weekly') {
                                    DateTime startOfWeek = now.subtract(
                                        Duration(days: now.weekday)); // Sunday
                                    DateTime endOfWeek = startOfWeek.add(
                                        const Duration(days: 6)); // Saturday
                                    startDate = startOfWeek
                                        .toIso8601String()
                                        .split('T')
                                        .first;
                                    endDate = endOfWeek
                                        .toIso8601String()
                                        .split('T')
                                        .first;
                                  } else {
                                    startDate = now
                                        .toIso8601String()
                                        .split('T')
                                        .first; // Today
                                    endDate = startDate; // Same day
                                  }

                                  // Fetch dashboard details with the previously selected user ID and dates
                                  dashboardProvider.fetchDashBoardDetails(
                                    startDate: startDate,
                                    endDate: endDate,
                                    paymentModeId:
                                        dashboardProvider.selectedPaymentId!,
                                    toUserId: dashboardProvider.selectedUser!,
                                  );
                                }
                              },
                              items: <String>[
                                'Monthly',
                                'Weekly',
                                'Today'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InfoCard(
                            imagePath: 'assets/images/avatar_image.png',
                            firstText: 'Total Walk-in',
                            secondText:
                                dashboardProvider.totalWalkins!.toString(),
                            backgroundColor: AppColors.appThemeOrange,
                            textColor: AppColors.appThemeOrange,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: InfoCard(
                            imagePath: 'assets/images/avatar_image.png',
                            firstText: 'Earnings',
                            secondText:
                                dashboardProvider.totalEarnings!.toString(),
                            backgroundColor:
                                AppColors.textGreen.withOpacity(.1),
                            textColor: AppColors.textGreen,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        itemCount: dashboardProvider.paymentModes.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final paymentMode =
                              dashboardProvider.paymentModes[index];

                          // Access the Payment Mode Name and ID from the map
                          final paymentModeName =
                              paymentMode['Payment_Mode_Name'] ?? 'Unknown';
                          final paymentModeId = paymentMode['Payment_Mode_Id'];

                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Update the selected user (assuming user is selected elsewhere)
                                  dashboardProvider.updateSelectedUser(
                                      dashboardProvider.selectedUser);

                                  // Update the selected payment mode
                                  dashboardProvider.updatePayment(
                                      paymentModeName,
                                      paymentModeId.toString());

                                  // Use the stored selectedTimeFrame to calculate start and end dates
                                  String startDate;
                                  String endDate;

                                  DateTime now = DateTime.now();
                                  if (dashboardProvider.selectedTimeFrame ==
                                      'Monthly') {
                                    startDate = DateTime(now.year, now.month, 1)
                                        .toIso8601String()
                                        .split('T')
                                        .first;
                                    endDate =
                                        DateTime(now.year, now.month + 1, 0)
                                            .toIso8601String()
                                            .split('T')
                                            .first;
                                  } else if (dashboardProvider
                                          .selectedTimeFrame ==
                                      'Weekly') {
                                    DateTime startOfWeek = now
                                        .subtract(Duration(days: now.weekday));
                                    DateTime endOfWeek = startOfWeek
                                        .add(const Duration(days: 6));
                                    startDate = startOfWeek
                                        .toIso8601String()
                                        .split('T')
                                        .first;
                                    endDate = endOfWeek
                                        .toIso8601String()
                                        .split('T')
                                        .first;
                                  } else {
                                    startDate =
                                        now.toIso8601String().split('T').first;
                                    endDate = startDate;
                                  }

                                  dashboardProvider.fetchDashBoardDetails(
                                    startDate: startDate,
                                    endDate: endDate,
                                    paymentModeId: paymentModeId.toString(),
                                    toUserId: dashboardProvider.selectedUser!,
                                  );
                                },
                                child: PaymentBlockWidget(
                                  svg: 'assets/images/cash.svg',
                                  label: paymentModeName,
                                  color:
                                      AppColors.appThemeOrange.withOpacity(.2),
                                  isSelected:
                                      dashboardProvider.selectedPayment ==
                                          paymentModeName,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount Collected: ₹0',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                     BottomNavigationScreen(
                                  initialPage: PaymentDetailsPage(
                                    dashBoardData:   dashboardProvider.dashBoardData,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textGrey600,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: AppColors.textGrey600,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    dashboardProvider.dashBoardData!.isEmpty
                        ? const Align(child: const Text('No Items Found'))
                        : ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                            itemCount: dashboardProvider.dashBoardData!.take(5).length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var transaction =
                                  dashboardProvider.dashBoardData![index];

                              return CustomerTransactionWidget(
                                staffName: transaction.toUserName,
                                time: formatTime(transaction.date.toString()),
                                date: formatDate(transaction.date.toString()),
                                customer: transaction.customerName,
                                service: transaction.packageName,
                                amount:
                                    '₹${double.parse(transaction.packageAmount)}\n(${transaction.paymentModeName})',
                              );
                            },
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
