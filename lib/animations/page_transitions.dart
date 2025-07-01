import 'package:flutter/material.dart';

class FadeThroughPageRoute<T> extends PageRouteBuilder<T> {
  FadeThroughPageRoute({required Widget page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
}
