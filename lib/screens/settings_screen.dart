import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              subtitle: const Text('Manage your profile info'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Security'),
              subtitle: const Text('Change password, setup 2FA, view logs'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Appearance'),
              subtitle: const Text('Theme settings'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              subtitle: const Text('Security alerts, login notifications'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Export All Data'),
              onTap: () {},
            ),
          ),
          Card(
            color: Colors.red[50],
            child: ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
              subtitle: const Text('Permanently delete your account and all data'),
              onTap: () {
                // Confirm and delete account logic
              },
            ),
          ),
        ],
      ),
    );
  }
}
