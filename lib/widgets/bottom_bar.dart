import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String selectedRoute;
  final Function(String) onNavigate;

  const BottomBar({required this.selectedRoute, required this.onNavigate, super.key});

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': Icons.dashboard, 'label': 'Dashboard', 'route': '/dashboard'},
      {'icon': Icons.vpn_key, 'label': 'Credentials', 'route': '/credentials'},
      {'icon': Icons.shield, 'label': 'TOTP', 'route': '/totp'},
      {'icon': Icons.folder, 'label': 'Folders', 'route': '/folders'},
      {'icon': Icons.settings, 'label': 'Settings', 'route': '/settings'},
    ];

    int currentIndex = navItems.indexWhere((item) => item['route'] == selectedRoute);
    if (currentIndex == -1) currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (i) => onNavigate(navItems[i]['route'] as String),
      items: navItems
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item['icon'] as IconData),
                label: item['label'] as String,
              ))
          .toList(),
    );
  }
}
