import 'package:flutter/material.dart';

class ConditionnalWrapper extends StatelessWidget {
  const ConditionnalWrapper({
    required this.wrapperbuilder,
    required this.child,
    required this.hasWrapper,
    super.key,
  });

  final Widget Function(Widget child) wrapperbuilder;
  final Widget child;
  final bool hasWrapper;

  @override
  Widget build(BuildContext context) {
    if (!hasWrapper) {
      return child;
    }

    return wrapperbuilder(child);
  }
}
