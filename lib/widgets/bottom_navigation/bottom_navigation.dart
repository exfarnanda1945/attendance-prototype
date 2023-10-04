import 'package:flutter/material.dart';

import 'navigation_bar_menu.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key,
      required this.currentPage,
      required this.onDestinationChange});
  final int currentPage;
  final ValueChanged<int> onDestinationChange;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (value) {
        onDestinationChange(value);
      },
      destinations: listNavigationBarMenu
          .asMap()
          .entries
          .map((item) => NavigationDestination(
                icon: changeIcon(item.key, item.value),
                label: item.value.title,
              ))
          .toList(),
      selectedIndex: currentPage,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    );
  }

  changeIcon(int index, NavigationBarMenu item) {
    IconData icon;
    if (index == currentPage) {
      icon = item.iconWhenSelected;
    } else {
      icon = item.icon;
    }

    return Icon(icon);
  }
}
