import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  final _profileFormKey = GlobalKey<FormState>();
  String _name = "John Doe";
  String _email = "john@example.com";
  bool _loading = false;

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

  void _saveProfile() {
    if (!_profileFormKey.currentState!.validate()) return;
    setState(() => _loading = true);
    // TODO: Save profile logic
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Profile updated')));
      }
    });
  }

  void _changePassword() {
    // TODO: Implement change password dialog
  }

  void _setup2FA() {
    // TODO: Implement 2FA setup
  }

  void _manageSessions() {
    // TODO: Implement session management
  }

  void _viewSecurityLog() {
    // TODO: Implement security log view
  }

  void _exportData() {
    // TODO: Implement export data
  }

  void _importData() {
    // TODO: Implement import data
  }

  void _deleteAccount() {
    // TODO: Implement delete account confirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Delete account logic
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _profileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Profile', style: theme.textTheme.titleMedium),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: _name,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                          ),
                          onChanged: (v) => _name = v,
                          validator: (v) => v != null && v.trim().isNotEmpty
                              ? null
                              : 'Required',
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: _email,
                          decoration: const InputDecoration(labelText: 'Email'),
                          onChanged: (v) => _email = v,
                          validator: (v) => v != null && v.contains('@')
                              ? null
                              : 'Enter a valid email',
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _loading ? null : _saveProfile,
                            child: _loading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Save Changes'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Security
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Security', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _changePassword,
                        child: const Text('Change Password'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _setup2FA,
                        child: const Text('Setup Two-Factor Authentication'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _manageSessions,
                        child: const Text('Manage Active Sessions'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _viewSecurityLog,
                        child: const Text('View Security Log'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Appearance
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Appearance', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                // TODO: Set light theme
                              },
                              child: const Text('Light'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                // TODO: Set dark theme
                              },
                              child: const Text('Dark'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                // TODO: Set system theme
                              },
                              child: const Text('System'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Data Management
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Management',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: _exportData,
                        icon: const Icon(Icons.download),
                        label: const Text('Export All Data'),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: _importData,
                        icon: const Icon(Icons.upload),
                        label: const Text('Import Data'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Danger Zone
              Card(
                color: Colors.red[50],
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Danger Zone',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Permanently delete your account and all associated data. This action cannot be undone.',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: _deleteAccount,
                        child: const Text('Delete Account'),
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
