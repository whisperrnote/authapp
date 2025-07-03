import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final String selectedRoute;
  final Function(String) onNavigate;

  const Sidebar({
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

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8D6748).withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            ...navItems.map((item) {
              final isSelected = selectedRoute == item['route'];
              final isBig = item['big'] == true;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: isBig ? 6 : 0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: isBig ? 28 : 22,
                    backgroundColor: isSelected
                        ? const Color(0xFF8D6748).withOpacity(0.18)
                        : const Color(0xFFBFAE99).withOpacity(0.12),
                    child: Icon(
                      item['icon'] as IconData,
                      color: const Color(0xFF8D6748),
                      size: isBig ? 34 : 24,
                    ),
                  ),
                  title: Text(
                    item['label'] as String,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? const Color(0xFF8D6748)
                          : Colors.black87,
                      fontSize: isBig ? 18 : 16,
                    ),
                  ),
                  selected: isSelected,
                  selectedTileColor: const Color(0xFFBFAE99).withOpacity(0.18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () => onNavigate(item['route'] as String),
                ),
              );
            }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // TODO: Implement logout logic
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
            }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // TODO: Implement logout logic
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
