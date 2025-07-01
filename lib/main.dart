```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const WhisperrAuthApp());
}

class WhisperrAuthApp extends StatelessWidget {
  const WhisperrAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whisperrauth',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/credentials': (context) => const CredentialsScreen(),
        '/credentials/new': (context) => const NewCredentialScreen(),
        '/folders': (context) => const FoldersScreen(),
        '/totp': (context) => const TotpScreen(),
        '/settings': (context) => const SettingsScreen(),
        // Add more routes as needed
      },
    );
  }
}

// Screens (to be implemented in lib/screens/)
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/credentials_screen.dart';
import 'screens/new_credential_screen.dart';
import 'screens/folders_screen.dart';
import 'screens/totp_screen.dart';
import 'screens/settings_screen.dart';
```