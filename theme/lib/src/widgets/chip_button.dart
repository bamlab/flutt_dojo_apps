import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/extensions.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/gap.dart';
import 'package:flutter_bam_theme/src/widgets/text.dart';

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
