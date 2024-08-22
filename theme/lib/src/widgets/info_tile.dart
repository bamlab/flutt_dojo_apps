// ignore_for_file: always_put_required_named_parameters_first

import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/gap.dart';
import 'package:flutter_bam_theme/src/widgets/tap.dart';
import 'package:flutter_bam_theme/src/widgets/text.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String name;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppTap(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: theme.colors.primaryLight),
          const AppGap.xxs(),
          AppText.bodyMedium(name, color: color),
        ],
      ),
    );
  }
}
