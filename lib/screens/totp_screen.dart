import 'package:flutter/material.dart';

class TotpScreen extends StatelessWidget {
  const TotpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totpCodes = [
      {'id': '1', 'issuer': 'GitHub', 'account': 'john@example.com', 'folder': 'Work'},
      {'id': '2', 'issuer': 'Google', 'account': 'john.doe@gmail.com', 'folder': 'Personal'},
      {'id': '3', 'issuer': 'AWS', 'account': 'johndoe', 'folder': 'Work'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TOTP Codes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: totpCodes.map((totp) => Card(
            child: ListTile(
              title: Text(totp['issuer']!),
              subtitle: Text(totp['account']!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.copy), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                ],
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
}
