import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final String selectedRoute;
  final Function(String) onNavigate;

  const Sidebar({required this.selectedRoute, required this.onNavigate, super.key});

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': Icons.dashboard, 'label': 'Dashboard', 'route': '/dashboard'},
      {'icon': Icons.vpn_key, 'label': 'Credentials', 'route': '/credentials'},
      {'icon': Icons.shield, 'label': 'TOTP', 'route': '/totp'},
      {'icon': Icons.folder, 'label': 'Folders', 'route': '/folders'},
      {'icon': Icons.settings, 'label': 'Settings', 'route': '/settings'},
    ];

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(Icons.shield, size: 32, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text('Whisperrauth', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          ...navItems.map((item) => ListTile(
                leading: Icon(item['icon'] as IconData),
                title: Text(item['label'] as String),
                selected: selectedRoute == item['route'],
                onTap: () => onNavigate(item['route'] as String),
              )),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TODO: Implement logout logic
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
