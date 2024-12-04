import 'package:spa_app_user/controller/login/login_provider.dart';
import 'package:spa_app_user/view/pages/admin/dashboard_screen.dart';
import 'package:spa_app_user/view/pages/admin/reports_screen.dart';
import 'package:spa_app_user/view/widgets/home/add_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/theme/app_colors.dart';

class BottomNavigationScreen extends StatelessWidget {
  final Widget? initialPage;

  const BottomNavigationScreen({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: _BottomNavigationBody(initialPage: initialPage),
    );
  }
}

class _BottomNavigationBody extends StatelessWidget {
  final Widget? initialPage;

  const _BottomNavigationBody({this.initialPage});

  // Method to show bottom sheet
  void showAddCustomer(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => AddCustomerWidget());
  }

  // Modify the _screens list to include the initial page if provided
  List<Widget> get _screens {
    List<Widget> defaultScreens = [
      const DashboardScreen(),
      const AddCustomerWidget(),
      const ReportsScreen(),
    ];

    // If an initial page is provided, replace the first screen
    if (initialPage != null) {
      defaultScreens[0] = initialPage!;
    }

    return defaultScreens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, login, child) {
       
          return _screens[login.selectedIndex];
        },
      ),
      bottomNavigationBar: Consumer<LoginProvider>(
        builder: (context, login, child) {
          return SizedBox(
            height: 95,
            child: BottomNavigationBar(
              currentIndex: login.selectedIndex,
              onTap: (index) {
                if (index == 1) {
                  showAddCustomer(context);
                } else {
                  Provider.of<LoginProvider>(context, listen: false)
                      .changeTab(index);
                }
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.appThemeOrange,
              unselectedItemColor: AppColors.textGrey600,
              selectedLabelStyle: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/dashboard.svg',
                    width: 24,
                    height: 24,
                    color: login.selectedIndex == 0
                        ? AppColors.appThemeOrange
                        : AppColors.textGrey600,
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: AppColors.appThemeOrange,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.add,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/report.svg',
                    width: 24,
                    height: 24,
                    color: login.selectedIndex == 2
                        ? AppColors.appThemeOrange
                        : AppColors.textGrey600,
                  ),
                  label: 'Report',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
