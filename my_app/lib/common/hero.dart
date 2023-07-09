import 'package:flutter/material.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  HeroDialogRoute({required this.builder});

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;
}
