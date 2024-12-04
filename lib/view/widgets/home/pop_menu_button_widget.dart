import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PopupMenuOptionsWidget extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PopupMenuOptionsWidget({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: AppColors.textGrey600,
      ),
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit();
            break;
          case 'delete':
            onDelete();
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'edit',
            child: Row(
              children: [
                Icon(Icons.edit, color: AppColors.textBlack),
                const SizedBox(width: 8),
                const Text('Edit'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete, color: AppColors.textBlack),
                const SizedBox(width: 8),
                const Text('Delete'),
              ],
            ),
          ),
        ];
      },
    );
  }
}
