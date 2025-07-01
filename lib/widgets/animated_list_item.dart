import 'package:flutter/material.dart';

class AnimatedListItem extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const AnimatedListItem({
    required this.child,
    required this.animation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 0.0,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1), // Slide up from bottom
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        child: FadeTransition(opacity: animation, child: child),
      ),
    );
  }
}
