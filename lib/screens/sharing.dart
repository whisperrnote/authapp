import 'dart:ui';
import 'package:flutter/material.dart';

class SharingScreen extends StatelessWidget {
  const SharingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6),
      appBar: AppBar(
        title: const Text(
          'Sharing',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 2,
            color: Color(0xFF8D6748),
            shadows: [
              Shadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.7),
        elevation: 8,
        shadowColor: Colors.brown.withOpacity(0.13),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.10),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(
                  color: const Color(0xFFBFAE99).withOpacity(0.4),
                  width: 1.2,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.share, size: 64, color: Color(0xFF8D6748)),
                  SizedBox(height: 16),
                  Text(
                    'Sharing Center',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xFF8D6748),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Manage shared credentials and invitations here.\nFeature coming soon!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFF8D6748)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
