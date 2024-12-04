import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListTileWidget extends StatelessWidget {
  final String staffName;
  final String userType;
  final bool isActive;
  final bool isPackage;
  final Color statusColor;
  final void Function()? onEdit; // Callback for edit action
  final void Function()? onDelete; // Callback for delete action

  const ListTileWidget({
    super.key,
    required this.staffName,
    required this.userType,
    this.isActive = true,
    required this.statusColor,
    required this.isPackage,
    this.onEdit, // Initialize edit callback
    this.onDelete, // Initialize delete callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          staffName,
          style: defaultTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ),
        subtitle: Text(
          userType,
          style: defaultTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textGrey600,
          ),
        ),
        trailing: isPackage
            ? PopupMenuButton<String>(
                color: AppColors.textWhite,
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: AppColors.textGrey600,
                ),
                onSelected: (value) {
                  if (value == 'edit' && onEdit != null) {
                    onEdit!();
                  } else if (value == 'delete' && onDelete != null) {
                    onDelete!();
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/edit.svg',
                            width: 18,
                            height: 18,
                            color: AppColors.textGrey600,
                          ),
                          const SizedBox(width: 8),
                          Text('Edit',
                              style: defaultTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack,
                              )),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/delete.svg',
                            width: 18,
                            height: 18,
                            color: AppColors.buttonRed,
                          ),
                          const SizedBox(width: 8),
                          Text('Delete',
                              style: defaultTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttonRed,
                              )),
                        ],
                      ),
                    ),
                  ];
                },
              )
            : Container(
                width: 65,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: statusColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Text(
                    '• ${isActive ? 'Active' : 'Inactive'}',
                    style: defaultTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
