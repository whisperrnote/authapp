import 'package:flutter/material.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen>
    with SingleTickerProviderStateMixin {
  String _search = '';
  String _viewMode = 'list'; // or 'grid'
  Set<String> _revealed = {};
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  final credentials = [
    {
      'id': '1',
      'name': 'GitHub',
      'username': 'john@example.com',
      'password': 'secretpass123',
      'url': 'github.com',
      'folder': 'Work',
      'tags': ['development', 'git'],
      'favicon': Icons.code,
    },
    {
      'id': '2',
      'name': 'Gmail',
      'username': 'john.doe@gmail.com',
      'password': 'anothersecret456',
      'url': 'gmail.com',
      'folder': 'Personal',
      'tags': ['email'],
      'favicon': Icons.email,
    },
    {
      'id': '3',
      'name': 'AWS Console',
      'username': 'johndoe',
      'password': 'awspassword789',
      'url': 'aws.amazon.com',
      'folder': 'Work',
      'tags': ['cloud', 'aws'],
      'favicon': Icons.cloud,
    },
  ];

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

  List<Map<String, dynamic>> get filteredCredentials {
    if (_search.isEmpty) return credentials;
    return credentials
        .where(
          (cred) =>
              cred['name'].toLowerCase().contains(_search.toLowerCase()) ||
              cred['username'].toLowerCase().contains(_search.toLowerCase()),
        )
        .toList();
  }

  void _toggleReveal(String id) {
    setState(() {
      if (_revealed.contains(id)) {
        _revealed.remove(id);
      } else {
        _revealed.add(id);
      }
    });
  }

  void _copyToClipboard(String text) {
    // TODO: Use clipboard package for real implementation
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied!')));
  }

  Widget _buildCredentialCard(Map<String, dynamic> cred) {
    final isRevealed = _revealed.contains(cred['id']);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(cred['favicon'], size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    cred['name'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit',
                  onPressed: () {
                    // TODO: Navigate to edit
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  tooltip: 'Delete',
                  onPressed: () {
                    // TODO: Delete action
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isRevealed ? cred['username'] : '••••••••••••••',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isRevealed ? Icons.visibility_off : Icons.visibility,
                  ),
                  tooltip: isRevealed ? 'Hide' : 'Reveal',
                  onPressed: () => _toggleReveal(cred['id']),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  tooltip: 'Copy Username',
                  onPressed: () => _copyToClipboard(cred['username']),
                ),
                const Spacer(),
                Text(
                  cred['folder'],
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 8),
                ...cred['tags']
                    .map<Widget>(
                      (tag) => Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            if (isRevealed)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectableText(
                        cred['password'],
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      tooltip: 'Copy Password',
                      onPressed: () => _copyToClipboard(cred['password']),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isGrid = _viewMode == 'grid';
    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Credentials'),
          actions: [
            IconButton(
              icon: Icon(isGrid ? Icons.list : Icons.grid_view),
              tooltip: isGrid ? 'List view' : 'Grid view',
              onPressed: () {
                setState(() {
                  _viewMode = isGrid ? 'list' : 'grid';
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add Credential',
              onPressed: () {
                Navigator.of(context).pushNamed('/credentials/new');
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search bar
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search credentials...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => setState(() => _search = v),
              ),
              const SizedBox(height: 16),
              // List/Grid
              Expanded(
                child: filteredCredentials.isEmpty
                    ? Center(
                        child: Text(
                          'No credentials found.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : isGrid
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: filteredCredentials.length,
                        itemBuilder: (context, i) =>
                            _buildCredentialCard(filteredCredentials[i]),
                      )
                    : ListView.separated(
                        itemCount: filteredCredentials.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, i) =>
                            _buildCredentialCard(filteredCredentials[i]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
