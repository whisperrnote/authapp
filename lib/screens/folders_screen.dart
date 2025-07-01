import 'package:flutter/material.dart';

class FoldersScreen extends StatefulWidget {
  const FoldersScreen({super.key});

  @override
  State<FoldersScreen> createState() => _FoldersScreenState();
}

class _FoldersScreenState extends State<FoldersScreen> {
  String newFolderName = '';
  String? editingFolderId;
  final folders = [
    {'id': '1', 'name': 'Work', 'credentialCount': 8, 'totpCount': 2, 'color': Colors.blue},
    {'id': '2', 'name': 'Personal', 'credentialCount': 12, 'totpCount': 3, 'color': Colors.green},
    {'id': '3', 'name': 'Banking', 'credentialCount': 4, 'totpCount': 1, 'color': Colors.red},
    {'id': '4', 'name': 'Shopping', 'credentialCount': 6, 'totpCount': 0, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Folders')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.create_new_folder_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Enter folder name...'),
                    onChanged: (v) => setState(() => newFolderName = v),
                    onSubmitted: (v) {
                      // Add folder logic
                      setState(() => newFolderName = '');
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: newFolderName.trim().isEmpty ? null : () {
                    // Add folder logic
                    setState(() => newFolderName = '');
                  },
                  child: const Text('Add Folder'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: folders.map((folder) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundColor: folder['color'] as Color, radius: 8),
                            const SizedBox(width: 8),
                            editingFolderId == folder['id']
                              ? Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    onSubmitted: (v) {
                                      // Edit folder logic
                                      setState(() => editingFolderId = null);
                                    },
                                    decoration: const InputDecoration(hintText: 'Folder name'),
                                  ),
                                )
                              : Expanded(child: Text(folder['name']!, style: const TextStyle(fontWeight: FontWeight.bold))),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => setState(() => editingFolderId = folder['id']),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Delete folder logic
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.vpn_key, size: 16),
                                const SizedBox(width: 4),
                                Text('Credentials: ${folder['credentialCount']}'),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.shield, size: 16),
                                const SizedBox(width: 4),
                                Text('TOTP: ${folder['totpCount']}'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('View Contents'),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
