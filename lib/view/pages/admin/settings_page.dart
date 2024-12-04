import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/view/pages/admin/manage_packages_page.dart';
import 'package:spa_app_user/view/pages/admin/manage_users_page.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:spa_app_user/view/widgets/home/back_button_widget.dart';
import 'package:spa_app_user/view/widgets/home/heading_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                const HeadingWidget(text: 'Settings'),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.textWhite,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: AppColors.textGrey600.withOpacity(.1))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manage Users',
                          style: defaultTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlack),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ManageUsersPage();
                                },
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: AppColors.textGrey600,
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.textWhite,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: AppColors.textGrey600.withOpacity(.1))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manage Packages',
                          style: defaultTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlack),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ManagePackagesPage();
                                },
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: AppColors.textGrey600,
                            ))
                      ],
                    ),
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
