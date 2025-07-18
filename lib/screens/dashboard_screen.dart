import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/bottom_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _navigate(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.of(context).pushReplacementNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;
        return Scaffold(
          backgroundColor: const Color(0xFFF5EFE6),
          appBar: isDesktop ? null : const _MobileAppBar(),
          body: isDesktop
              ? Row(
                  children: [
                    SizedBox(
                      width: 240,
                      child: Sidebar(
                        selectedRoute: '/dashboard',
                        onNavigate: (route) => _navigate(context, route),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const _DesktopAppBar(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              child: _DashboardContent(isDesktop: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: _DashboardContent(isDesktop: false),
                ),
          bottomNavigationBar: isDesktop
              ? null
              : BottomBar(
                  selectedRoute: '/dashboard',
                  onNavigate: (route) => _navigate(context, route),
                ),
        );
      },
    );
  }
}

// ----------------- Desktop AppBar -----------------
class _DesktopAppBar extends StatelessWidget {
  const _DesktopAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.13),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: const [
          Text(
            'WhisperrAuth',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
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
          SizedBox(width: 32),
          Expanded(child: _SearchBar()),
        ],
      ),
    );
  }
}

// ----------------- Mobile AppBar -----------------
class _MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MobileAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'WhisperrAuth',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          letterSpacing: 2,
          color: Color(0xFF8D6748),
          shadows: [
            Shadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2)),
          ],
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.7),
      elevation: 8,
      shadowColor: Colors.brown.withOpacity(0.13),
      centerTitle: true,
      toolbarHeight: 70,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: const Padding(
          padding: EdgeInsets.only(bottom: 12, left: 8, right: 8),
          child: _SearchBar(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

// ----------------- Search Bar -----------------
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.45),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: const Color(0xFFBFAE99).withOpacity(0.4),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Icon(
                Icons.search_rounded,
                color: Color(0xFF8D6748),
                size: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search passwords, usernames...',
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ----------------- Main Content -----------------
class _DashboardContent extends StatelessWidget {
  final bool isDesktop;
  const _DashboardContent({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _FilterRow(),
        const SizedBox(height: 8),
        const _SectionTitle(title: 'Recent'),
        const SizedBox(height: 8),
        ...List.generate(
          3,
          (i) => _PasswordItem(
            username: 'user${i + 1}@mail.com',
            hash: 'a1b2c3d4e5f6g7h8i9j0',
            isDesktop: isDesktop,
          ),
        ),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'All Items'),
        const SizedBox(height: 8),
        ...List.generate(
          10,
          (i) => _PasswordItem(
            username: 'demo${i + 1}@site.com',
            hash: 'z9y8x7w6v5u4t3s2r1q${i + 1}',
            isDesktop: isDesktop,
          ),
        ),
      ],
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: const [
          _FilterChip(label: 'Folder', icon: Icons.folder_rounded),
          SizedBox(width: 12),
          _FilterChip(
            label: 'Collection',
            icon: Icons.collections_bookmark_rounded,
          ),
          SizedBox(width: 12),
          _FilterChip(label: 'Kind', icon: Icons.category_rounded),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const _FilterChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.10),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: const Color(0xFFBFAE99).withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF8D6748), size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF8D6748),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF8D6748),
        shadows: [
          Shadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
    );
  }
}

class _PasswordItem extends StatelessWidget {
  final String username;
  final String hash;
  final bool isDesktop;
  const _PasswordItem({
    required this.username,
    required this.hash,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.55),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.10),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: const Color(0xFFBFAE99).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFBFAE99).withOpacity(0.7),
                child: const Icon(
                  Icons.person_rounded,
                  color: Color(0xFF8D6748),
                ),
              ),
              title: Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8D6748),
                ),
              ),
              subtitle: Text(
                hash,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFFBFAE99),
                  fontSize: 13,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _CopyIconButton(),
                  if (isDesktop) const SizedBox(width: 8),
                  if (isDesktop) const _CopyIconButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CopyIconButton extends StatelessWidget {
  const _CopyIconButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          // TODO: Implement copy logic
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Copied!')));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.10),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.copy_rounded,
            color: Color(0xFF8D6748),
            size: 22,
          ),
        ),
      ),
    );
  }
}
