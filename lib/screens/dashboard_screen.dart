import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        'title': 'Total Credentials',
        'value': '24',
        'icon': Icons.vpn_key,
        'color': const Color(0xFF8D6748),
      },
      {
        'title': 'TOTP Codes',
        'value': '8',
        'icon': Icons.shield,
        'color': const Color(0xFFBFAE99),
      },
      {
        'title': 'Recent Activity',
        'value': '3',
        'icon': Icons.access_time,
        'color': const Color(0xFF8D6748),
      },
      {
        'title': 'Security Alerts',
        'value': '1',
        'icon': Icons.warning,
        'color': Colors.red,
      },
    ];

    final recentItems = [
      {
        'name': 'GitHub',
        'username': 'john@example.com',
        'lastUsed': '2 hours ago',
      },
      {
        'name': 'Gmail',
        'username': 'john.doe@gmail.com',
        'lastUsed': '5 hours ago',
      },
      {'name': 'AWS Console', 'username': 'johndoe', 'lastUsed': '1 day ago'},
    ];

    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.white.withOpacity(0.7),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back! Here's your security overview.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              // Stats Grid
              GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 900
                    ? 4
                    : MediaQuery.of(context).size.width > 600
                    ? 2
                    : 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: stats
                    .map(
                      (stat) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8D6748).withOpacity(0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 1.5),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    stat['title'] as String,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    stat['value'] as String,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: stat['color'] as Color,
                                        ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: (stat['color'] as Color)
                                    .withOpacity(0.12),
                                child: Icon(
                                  stat['icon'] as IconData,
                                  size: 28,
                                  color: stat['color'] as Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),
              // Quick Actions
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8D6748).withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text('Add Credential'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8D6748),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed('/credentials/new');
                            },
                          ),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.download),
                            label: const Text('Backup Vault'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8D6748),
                              side: const BorderSide(color: Color(0xFF8D6748)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                          ),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.list_alt),
                            label: const Text('View Logs'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8D6748),
                              side: const BorderSide(color: Color(0xFF8D6748)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Recent Items
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8D6748).withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Items',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      ...recentItems.map(
                        (item) => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(
                                0xFF8D6748,
                              ).withOpacity(0.12),
                              child: const Icon(
                                Icons.vpn_key,
                                color: Color(0xFF8D6748),
                              ),
                            ),
                            title: Text(
                              item['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              item['username']!,
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                color: Color(0xFFBFAE99),
                              ),
                            ),
                            trailing: Text(
                              item['lastUsed']!,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
