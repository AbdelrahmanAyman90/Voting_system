import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Drawer/Custom_drawer_widget/custom_drawer_header.dart';
import 'package:voting/presntion%20layer/Screens/Drawer/Custom_drawer_widget/drawer_item_model.dart';
import 'package:voting/presntion%20layer/Screens/Drawer/Custom_drawer_widget/drawer_items.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.onItemSelected,
    required this.activeIndex,
  });
  final Function(int) onItemSelected;
  final int activeIndex;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late List<DrawerItemModel> items;

  @override
  Widget build(BuildContext context) {
    items = [
      DrawerItemModel(
        title: S.of(context).home,
        icon: Icons.home,
      ),
      DrawerItemModel(
        title: S.of(context).vote,
        icon: Icons.how_to_vote_outlined,
      ),
      DrawerItemModel(
        title: S.of(context).results,
        icon: Icons.stacked_bar_chart_sharp,
      ),
      DrawerItemModel(
        title: S.of(context).profile,
        icon: Icons.person,
      ),
    ];
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Expanded(
              flex: 1, child: FittedBox(child: CustomDrawerHeader())),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: DrawerItem(
                    onTap: () => widget.onItemSelected(index),
                    drawerItemModel: items[index],
                    isActive: widget.activeIndex == index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
