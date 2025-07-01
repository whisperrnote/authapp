import 'package:flutter/material.dart';
import 'responsive_layout.dart';
import 'sidebar.dart';
import 'bottom_bar.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final String selectedRoute;

  const AppShell({required this.child, required this.selectedRoute, super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  void _navigate(String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.of(context).pushReplacementNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomBar(
          selectedRoute: widget.selectedRoute,
          onNavigate: _navigate,
        ),
      ),
      desktop: Scaffold(
        drawer: Sidebar(
          selectedRoute: widget.selectedRoute,
          onNavigate: _navigate,
        ),
        body: Row(
          children: [
            SizedBox(
              width: 240,
              child: Sidebar(
                selectedRoute: widget.selectedRoute,
                onNavigate: _navigate,
              ),
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
