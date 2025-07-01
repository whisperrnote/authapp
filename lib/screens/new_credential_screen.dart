import 'package:flutter/material.dart';
import 'dart:math';

class NewCredentialScreen extends StatefulWidget {
  const NewCredentialScreen({super.key});

  @override
  State<NewCredentialScreen> createState() => _NewCredentialScreenState();
}

class _NewCredentialScreenState extends State<NewCredentialScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String _name = '';
  String _url = '';
  String _username = '';
  String _password = '';
  String _notes = '';
  String _folder = '';
  String _tags = '';
  List<Map<String, String>> _customFields = [];

  void _generatePassword() {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*';
    final rand = Random.secure();
    setState(() {
      _password = List.generate(
        16,
        (_) => charset[rand.nextInt(charset.length)],
      ).join();
    });
  }

  void _addCustomField() {
    setState(() {
      _customFields.add({'label': '', 'value': ''});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Credential')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name *'),
                onChanged: (v) => _name = v,
                validator: (v) => v != null && v.isNotEmpty ? null : 'Required',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Website URL'),
                onChanged: (v) => _url = v,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username/Email *',
                ),
                onChanged: (v) => _username = v,
                validator: (v) => v != null && v.isNotEmpty ? null : 'Required',
              ),
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
                          onPressed: () =>
                              setState(() => _showPassword = !_showPassword),
                        ),
                      ),
                      obscureText: !_showPassword,
                      onChanged: (v) => _password = v,
                      validator: (v) =>
                          v != null && v.isNotEmpty ? null : 'Required',
                      controller: TextEditingController(text: _password),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _generatePassword,
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Folder'),
                onChanged: (v) => _folder = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tags'),
                onChanged: (v) => _tags = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Notes'),
                onChanged: (v) => _notes = v,
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Custom Fields',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addCustomField,
                  ),
                ],
              ),
              ..._customFields.asMap().entries.map((entry) {
                final idx = entry.key;
                final field = entry.value;
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Field name',
                        ),
                        onChanged: (v) =>
                            setState(() => _customFields[idx]['label'] = v),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Field value',
                        ),
                        onChanged: (v) =>
                            setState(() => _customFields[idx]['value'] = v),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () =>
                          setState(() => _customFields.removeAt(idx)),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Save credential logic
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save Credential'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
