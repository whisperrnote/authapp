import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String selectedRoute;
  final Function(String) onNavigate;

  const BottomBar({
    required this.selectedRoute,
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': Icons.dashboard, 'label': 'Dashboard', 'route': '/dashboard'},
      {'icon': Icons.share, 'label': 'Sharing', 'route': '/sharing'},
      {
        'icon': Icons.add_circle,
        'label': 'New',
        'route': '/credentials/new',
        'big': true,
      },
      {'icon': Icons.shield, 'label': 'TOTP', 'route': '/totp'},
      {'icon': Icons.settings, 'label': 'Settings', 'route': '/settings'},
    ];

    int currentIndex = navItems.indexWhere(
      (item) => item['route'] == selectedRoute,
    );
    if (currentIndex == -1) currentIndex = 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8D6748).withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF8D6748),
        unselectedItemColor: const Color(0xFFBFAE99),
        showUnselectedLabels: true,
        onTap: (i) => onNavigate(navItems[i]['route'] as String),
        items: navItems.map((item) {
          final isBig = item['big'] == true;
          return BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: isBig ? 28 : 20,
              backgroundColor: currentIndex == navItems.indexOf(item)
                  ? const Color(0xFF8D6748).withOpacity(0.18)
                  : const Color(0xFFBFAE99).withOpacity(0.12),
              child: Icon(
                item['icon'] as IconData,
                color: const Color(0xFF8D6748),
                size: isBig ? 34 : 24,
              ),
            ),
            label: item['label'] as String,
          );
        }).toList(),
      ),
    );
  }
}
