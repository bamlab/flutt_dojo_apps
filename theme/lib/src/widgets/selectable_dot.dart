import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class AppSelectableDot extends StatelessWidget {
  const AppSelectableDot({
    required this.animationDuration,
    required this.isSelected,
    required this.borderColor,
    super.key,
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
