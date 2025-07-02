import 'package:flutter/material.dart';

class FoldersScreen extends StatefulWidget {
  const FoldersScreen({super.key});

  @override
  State<FoldersScreen> createState() => _FoldersScreenState();
}

class _FoldersScreenState extends State<FoldersScreen>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  String? _editingId;
  String _newFolderName = '';
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  List<Map<String, dynamic>> folders = [
    {
      'id': '1',
      'name': 'Work',
      'credentialCount': 8,
      'totpCount': 2,
      'color': Colors.blue,
    },
    {
      'id': '2',
      'name': 'Personal',
      'credentialCount': 12,
      'totpCount': 3,
      'color': Colors.green,
    },
    {
      'id': '3',
      'name': 'Banking',
      'credentialCount': 4,
      'totpCount': 1,
      'color': Colors.red,
    },
    {
      'id': '4',
      'name': 'Shopping',
      'credentialCount': 6,
      'totpCount': 0,
      'color': Colors.purple,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _addFolder() {
    if (_newFolderName.trim().isEmpty) return;
    setState(() {
      folders.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': _newFolderName.trim(),
        'credentialCount': 0,
        'totpCount': 0,
        'color': Colors.grey,
      });
      _newFolderName = '';
      _controller.clear();
    });
  }

  void _editFolder(String id, String newName) {
    setState(() {
      final idx = folders.indexWhere((f) => f['id'] == id);
      if (idx != -1) {
        folders[idx]['name'] = newName;
      }
      _editingId = null;
    });
  }

  void _deleteFolder(String id) {
    setState(() {
      folders.removeWhere((f) => f['id'] == id);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Folder deleted')));
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final isTablet = MediaQuery.of(context).size.width > 600;
    final gridCount = isWide
        ? 3
        : isTablet
        ? 2
        : 1;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        appBar: AppBar(title: const Text('Folders')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Add New Folder
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
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.create_new_folder_outlined,
                      color: const Color(0xFF8D6748),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter folder name...',
                          border: InputBorder.none,
                        ),
                        onChanged: (v) => setState(() => _newFolderName = v),
                        onSubmitted: (_) => _addFolder(),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8D6748),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 8,
                      ),
                      onPressed: _newFolderName.trim().isEmpty
                          ? null
                          : _addFolder,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Folder'),
                    ),
                  ],
                ),
              ),
              // Folders Grid/List
              Expanded(
                child: folders.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.folder_open,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No folders created',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Create your first folder to organize your credentials',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridCount,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: folders.length,
                        itemBuilder: (context, i) {
                          final folder = folders[i];
                          final isEditing = _editingId == folder['id'];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF8D6748,
                                  ).withOpacity(0.08),
                                  blurRadius: 24,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: folder['color'],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      isEditing
                                          ? Expanded(
                                              child: TextField(
                                                autofocus: true,
                                                controller:
                                                    TextEditingController(
                                                      text: folder['name'],
                                                    ),
                                                onSubmitted: (v) => _editFolder(
                                                  folder['id'],
                                                  v,
                                                ),
                                                onEditingComplete: () =>
                                                    setState(
                                                      () => _editingId = null,
                                                    ),
                                              ),
                                            )
                                          : Expanded(
                                              child: Text(
                                                folder['name'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        tooltip: 'Rename',
                                        onPressed: () => setState(() {
                                          _editingId = folder['id'];
                                        }),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        tooltip: 'Delete',
                                        onPressed: () =>
                                            _deleteFolder(folder['id']),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.vpn_key,
                                        size: 18,
                                        color: const Color(0xFF8D6748),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${folder['credentialCount']} Credentials',
                                        style: const TextStyle(
                                          fontFamily: 'monospace',
                                          color: Color(0xFFBFAE99),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(
                                        Icons.shield,
                                        size: 18,
                                        color: const Color(0xFF8D6748),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${folder['totpCount']} TOTP',
                                        style: const TextStyle(
                                          fontFamily: 'monospace',
                                          color: Color(0xFFBFAE99),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton.icon(
                                      icon: const Icon(Icons.folder_open),
                                      label: const Text('View Contents'),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: const Color(
                                          0xFF8D6748,
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xFF8D6748),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // TODO: Navigate to folder detail
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
