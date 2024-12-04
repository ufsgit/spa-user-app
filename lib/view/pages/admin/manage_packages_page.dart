import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:spa_app_user/view/widgets/home/add_new_package_widget.dart';
import 'package:spa_app_user/view/widgets/home/back_button_widget.dart';
import 'package:spa_app_user/view/widgets/home/home_text_field_widget.dart';
import 'package:spa_app_user/view/widgets/home/list_tile_widget.dart';
import 'package:flutter/material.dart';

class ManagePackagesPage extends StatelessWidget {
  const ManagePackagesPage({super.key});
  void showAddServiceBottomSheet(BuildContext context, bool isEdit) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => AddNewPackageWidget(
              isEdit: isEdit,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButtonWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Center(
                          child: Text(
                        'Manage Packages',
                        style: defaultTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack),
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                HomeTextFieldWidget(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.textGrey600,
                      size: 24,
                    ),
                    controller: TextEditingController(),
                    hintText: 'Search'),
                const SizedBox(
                  height: 16,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTileWidget(
                        onEdit: () {
                          showAddServiceBottomSheet(context, true);
                        },
                        onDelete: () {},
                        isPackage: true,
                        staffName: 'Package Name',
                        userType: 'userType',
                        statusColor: AppColors.buttonRed);
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () {
              showAddServiceBottomSheet(context, false);
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: AppColors.appThemeOrange,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.add,
                color: AppColors.textWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
