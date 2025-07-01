import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        'title': 'Total Credentials',
        'value': '24',
        'icon': Icons.vpn_key,
        'color': Colors.blue,
      },
      {
        'title': 'TOTP Codes',
        'value': '8',
        'icon': Icons.shield,
        'color': Colors.green,
      },
      {
        'title': 'Recent Activity',
        'value': '3',
        'icon': Icons.access_time,
        'color': Colors.orange,
      },
      {
        'title': 'Security Alerts',
        'value': '1',
        'icon': Icons.warning,
        'color': Colors.red,
      },
    ];

    final recentItems = [
      {'name': 'GitHub', 'username': 'john@example.com'},
      {'name': 'Gmail', 'username': 'john.doe@gmail.com'},
      {'name': 'AWS Console', 'username': 'johndoe'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Welcome back! Here\'s your security overview.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // Stats Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2.5,
            children: stats
                .map(
                  (stat) => Card(
                    child: ListTile(
                      leading: Icon(
                        stat['icon'] as IconData,
                        color: stat['color'] as Color,
                      ),
                      title: Text(stat['title'] as String),
                      trailing: Text(
                        stat['value'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          // Quick Actions
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Actions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add Credential'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Backup Vault'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.list),
                        label: const Text('View Logs'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Recent Items
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Items',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...recentItems.map(
                    (item) => ListTile(
                      leading: const Icon(Icons.vpn_key),
                      title: Text(item['name']!),
                      subtitle: Text(item['username']!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
