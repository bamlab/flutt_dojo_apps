import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter/material.dart';

class AppSelectableDot extends StatelessWidget {
  const AppSelectableDot({
    super.key,
    required this.animationDuration,
    required this.isSelected,
    required this.borderColor,
  });

  final Duration animationDuration;
  final bool isSelected;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: animationDuration,
      height: isSelected ? theme.sizes.xl : theme.sizes.l,
      width: isSelected ? theme.sizes.xl : theme.sizes.l,
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? theme.sizes.xs : theme.sizes.xxxs,
          color: borderColor,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
