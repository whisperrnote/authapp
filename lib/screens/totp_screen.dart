import 'package:flutter/material.dart';

class TotpScreen extends StatelessWidget {
  const TotpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totpCodes = [
      {
        'id': '1',
        'issuer': 'GitHub',
        'account': 'john@example.com',
        'folder': 'Work',
      },
      {
        'id': '2',
        'issuer': 'Google',
        'account': 'john.doe@gmail.com',
        'folder': 'Personal',
      },
      {'id': '3', 'issuer': 'AWS', 'account': 'johndoe', 'folder': 'Work'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TOTP Codes'),
        backgroundColor: Colors.white.withOpacity(0.7),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            tooltip: 'Add TOTP',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: totpCodes
              .map(
                (totp) => Container(
                  margin: const EdgeInsets.only(bottom: 16),
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
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF8D6748).withOpacity(0.18),
                      child: const Icon(Icons.shield, color: Color(0xFF8D6748)),
                    ),
                    title: Text(
                      totp['issuer']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D6748),
                      ),
                    ),
                    subtitle: Text(
                      totp['account']!,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Color(0xFFBFAE99),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy, color: Color(0xFF8D6748)),
                          tooltip: 'Copy',
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Color(0xFF8D6748)),
                          tooltip: 'Edit',
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          tooltip: 'Delete',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
