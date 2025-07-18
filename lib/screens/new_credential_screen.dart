import 'package:flutter/material.dart';

class NewCredentialScreen extends StatefulWidget {
  const NewCredentialScreen({super.key});

  @override
  State<NewCredentialScreen> createState() => _NewCredentialScreenState();
}

class _NewCredentialScreenState extends State<NewCredentialScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _loading = false;
  String _name = '';
  String _url = '';
  String _username = '';
  String _password = '';
  String _notes = '';
  String _folder = '';
  String _tags = '';
  final List<Map<String, String>> _customFields = [];
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

  void _generatePassword() {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*';
    String pwd = '';
    for (int i = 0; i < 16; i++) {
      pwd +=
          charset[(charset.length *
                  (i + DateTime.now().millisecondsSinceEpoch) %
                  charset.length) %
              charset.length];
    }
    setState(() {
      _password = pwd;
    });
  }

  void _addCustomField() {
    setState(() {
      _customFields.add({'label': '', 'value': ''});
    });
  }

  void _removeCustomField(int index) {
    setState(() {
      _customFields.removeAt(index);
    });
  }

  void _updateCustomField(int index, String key, String value) {
    setState(() {
      _customFields[index][key] = value;
    });
  }

  Future<void> _saveCredential() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    // TODO: Save logic here
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) {
      Navigator.of(context).pop();
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Credential'),
          backgroundColor: Colors.white.withOpacity(0.7),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
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
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name & URL
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Name *',
                                hintText: 'e.g., GitHub, Gmail',
                              ),
                              onChanged: (v) => _name = v,
                              validator: (v) => v != null && v.trim().isNotEmpty
                                  ? null
                                  : 'Required',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Website URL',
                                hintText: 'https://example.com',
                              ),
                              onChanged: (v) => _url = v,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Username
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username/Email *',
                        ),
                        onChanged: (v) => _username = v,
                        validator: (v) => v != null && v.trim().isNotEmpty
                            ? null
                            : 'Required',
                      ),
                      const SizedBox(height: 16),
                      // Password
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password *',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () => setState(
                                    () => _showPassword = !_showPassword,
                                  ),
                                ),
                              ),
                              obscureText: !_showPassword,
                              onChanged: (v) => _password = v,
                              validator: (v) => v != null && v.length >= 6
                                  ? null
                                  : 'Min 6 chars',
                              controller: TextEditingController(
                                text: _password,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: _generatePassword,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Generate'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8D6748),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Folder & Tags
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Folder',
                                hintText: 'Work, Personal, etc.',
                              ),
                              onChanged: (v) => _folder = v,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Tags',
                                hintText: 'Comma separated',
                              ),
                              onChanged: (v) => _tags = v,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Notes
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Notes'),
                        minLines: 2,
                        maxLines: 5,
                        onChanged: (v) => _notes = v,
                      ),
                      const SizedBox(height: 16),
                      // Custom Fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Custom Fields',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton.icon(
                            onPressed: _addCustomField,
                            icon: const Icon(Icons.add),
                            label: const Text('Add Field'),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF8D6748),
                            ),
                          ),
                        ],
                      ),
                      ..._customFields.asMap().entries.map((entry) {
                        final i = entry.key;
                        final field = entry.value;
                        return Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Field name',
                                ),
                                onChanged: (v) =>
                                    _updateCustomField(i, 'label', v),
                                initialValue: field['label'],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Field value',
                                ),
                                onChanged: (v) =>
                                    _updateCustomField(i, 'value', v),
                                initialValue: field['value'],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => _removeCustomField(i),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8D6748),
                              side: const BorderSide(color: Color(0xFF8D6748)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: _loading ? null : _saveCredential,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8D6748),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                            child: _loading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Save Credential'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
