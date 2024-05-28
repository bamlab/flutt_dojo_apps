import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class ChipButton extends StatelessWidget {
  const ChipButton({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    super.key,
  });

  final void Function()? onTap;
  final String label;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Chip(
          // padded increases the size of the tap target to 48px * 48px
          materialTapTargetSize: MaterialTapTargetSize.padded,
          padding: theme.sizes.asInsets.xs.horizontalOnly,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: theme.sizes.xl),
              const AppGap.xxs(),
              AppText.titleSmall(label),
            ],
          ),
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
