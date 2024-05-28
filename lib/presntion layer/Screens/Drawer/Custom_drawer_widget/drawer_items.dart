import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Drawer/Custom_drawer_widget/drawer_item_model.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isActive,
    required this.onTap,
  });

  final DrawerItemModel drawerItemModel;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItemModel.icon,
          color: isActive ? AppColors.mainColor : AppColors.secondaryTextColor),
      title: FittedBox(
        //alignment: Alignment.centerRight,
        fit: BoxFit.scaleDown,
        child: Text(drawerItemModel.title,
            style: AppFonts.semiBoldText(context, 14,
                isActive ? AppColors.mainColor : AppColors.secondaryTextColor)),
      ),
      trailing: isActive
          ? Container(
              width: 3.27,
              decoration: BoxDecoration(color: AppColors.mainColor),
            )
          : null,
      onTap: () => onTap(),
    );
  }
}
