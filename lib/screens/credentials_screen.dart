import 'package:flutter/material.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  String searchTerm = '';
  bool gridView = false;

  final credentials = [
    {
      'id': '1',
      'name': 'GitHub',
      'username': 'john@example.com',
      'password': 'secretpass123',
      'folder': 'Work',
      'tags': ['development', 'git'],
    },
    {
      'id': '2',
      'name': 'Gmail',
      'username': 'john.doe@gmail.com',
      'password': 'anothersecret456',
      'folder': 'Personal',
      'tags': ['email'],
    },
    {
      'id': '3',
      'name': 'AWS Console',
      'username': 'johndoe',
      'password': 'awspassword789',
      'folder': 'Work',
      'tags': ['cloud', 'aws'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = credentials
        .where(
          (cred) =>
              cred['name']!.toLowerCase().contains(searchTerm.toLowerCase()) ||
              cred['username']!.toLowerCase().contains(
                searchTerm.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Credentials'),
        actions: [
          IconButton(
            icon: Icon(gridView ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => gridView = !gridView),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/credentials/new'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search credentials...',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => searchTerm = v),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No credentials found'))
                : gridView
                ? GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    children: filtered
                        .map(
                          (cred) => Card(
                            child: ListTile(
                              title: Text(cred['name']!),
                              subtitle: Text(cred['username']!),
                              trailing: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  // Copy username/password logic
                                },
                              ),
                              onTap: () {},
                            ),
                          ),
                        )
                        .toList(),
                  )
                : ListView(
                    children: filtered
                        .map(
                          (cred) => Card(
                            child: ListTile(
                              title: Text(cred['name']!),
                              subtitle: Text(cred['username']!),
                              trailing: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  // Copy username/password logic
                                },
                              ),
                              onTap: () {},
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
