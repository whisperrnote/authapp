import 'package:flutter/material.dart';
import 'logics/auth_service.dart'; // Add this import
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
import 'screens/sharing.dart';

void main() {
  runApp(const WhisperrAuthApp());
}

class WhisperrAuthApp extends StatelessWidget {
  const WhisperrAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whisperrauth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => AuthGuard(child: const DashboardScreen()),
        '/credentials/new': (context) =>
            AuthGuard(child: const NewCredentialScreen()),
        '/sharing': (context) => AuthGuard(child: const SharingScreen()),
        '/totp': (context) => AuthGuard(child: const TotpScreen()),
        '/settings': (context) => AuthGuard(child: const SettingsScreen()),
        // Add more routes as needed
      },
    );
  }
}

/// AuthGuard widget for secure routing
class AuthGuard extends StatelessWidget {
  final Widget child;
  const AuthGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.instance.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (!AuthService.instance.isAuthenticated) {
          // Not authenticated, redirect to login
          Future.microtask(() {
            Navigator.of(context).pushReplacementNamed('/login');
          });
          return const SizedBox.shrink();
        }
        // Authenticated, show the protected screen
        return child;
      },
    );
  }
}
