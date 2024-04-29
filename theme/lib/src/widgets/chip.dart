import 'package:flutter/material.dart';

import '../../cdapp_theme.dart';

class _Dot extends StatelessWidget {
  const _Dot({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: SizedBox.square(
        dimension: theme.sizes.xs,
      ),
    );
  }
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.color,
    required this.label,
    this.backgroundColor,
  });

  final Color color;
  final String label;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Dot(color: color),
          const AppGap.xxs(),
          AppText.bodySmall(label, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
