import 'package:flutter/material.dart';

class ConditionnalWrapper extends StatelessWidget {
  const ConditionnalWrapper({
    super.key,
    required this.wrapperbuilder,
    required this.child,
    required this.hasWrapper,
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
