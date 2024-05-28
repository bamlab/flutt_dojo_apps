import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class WarningInformation extends StatelessWidget {
  const WarningInformation({
    required this.description,
    super.key,
    this.maxLines = 2,
  });

  final String description;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          ThemeIcons.circleinfo_regular,
          color: theme.colors.statusWarning,
        ),
        const AppGap.xs(),
        Flexible(
          child: AppText.bodyMedium(
            description,
            color: theme.colors.grey300,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
