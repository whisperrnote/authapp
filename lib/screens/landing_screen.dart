import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.08),
                    theme.scaffoldBackgroundColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Main content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8D6748).withOpacity(0.08),
                      blurRadius: 32,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo and App Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFF8D6748),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF8D6748,
                                  ).withOpacity(0.18),
                                  blurRadius: 12,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.shield,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Whisperrauth',
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF8D6748),
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Headline
                      Text(
                        'Your Passwords. Protected. Everywhere.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF8D6748),
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Subheadline
                      Text(
                        'Secure, simple password management for individuals and teams. Store unlimited passwords, generate strong credentials, and autofill with ease.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF8D6748).withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // CTA Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/register'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8D6748),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 8,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            child: const Text('Get Started Free'),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/login'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8D6748),
                              side: const BorderSide(
                                color: Color(0xFF8D6748),
                                width: 2,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      // Features (minimal, for landing)
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 24,
                        runSpacing: 16,
                        children: [
                          _FeatureIconText(
                            icon: Icons.lock,
                            label: 'Zero-Knowledge Encryption',
                          ),
                          _FeatureIconText(
                            icon: Icons.vpn_key,
                            label: 'Password Generator',
                          ),
                          _FeatureIconText(
                            icon: Icons.fingerprint,
                            label: 'Biometric Auth',
                          ),
                          _FeatureIconText(
                            icon: Icons.sync,
                            label: 'Automatic Sync',
                          ),
                          _FeatureIconText(
                            icon: Icons.shield,
                            label: '2FA/TOTP',
                          ),
                          _FeatureIconText(
                            icon: Icons.devices,
                            label: 'Cross-Platform',
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      // Footer
                      Text(
                        '© ${DateTime.now().year} Whisperrauth. All rights reserved.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureIconText extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureIconText({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
          child: Icon(icon, color: theme.colorScheme.primary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: theme.textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
