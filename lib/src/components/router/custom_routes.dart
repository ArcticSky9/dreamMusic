import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget child;
  final int duration;

  FadeRoute({required this.child, this.duration = 300})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) {
              return child;
            },
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, from, to, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                  parent: from,
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              );
            });
}

// 页面从右向左进入
class PushRoute extends PageRouteBuilder {
  final Widget child;
  final int duration;

  PushRoute({
    required this.child,
    this.duration = 300,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, from, to, child) {
              return SlideTransition(
                position:
                    Tween(begin: const Offset(1.0, 0), end: const Offset(0, 0))
                        .animate(CurvedAnimation(
                            parent: from, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

// 页面从下到上
class ModelRoute extends PageRouteBuilder {
  final Widget child;
  final int duration;

  ModelRoute({
    required this.child,
    this.duration = 300,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, from, to, child) {
              return SlideTransition(
                position:
                    Tween(begin: const Offset(0, 1.0), end: const Offset(0, 0))
                        .animate(CurvedAnimation(
                            parent: from, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
