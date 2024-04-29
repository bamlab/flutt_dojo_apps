import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:sliver_tools/sliver_tools.dart';

class EmptySliverView extends StatelessWidget {
  const EmptySliverView({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.header,
    this.bottom,
  }) : assert(
          icon != null || header != null,
          'Either icon or header must be provided',
        );

  final Widget? header;
  final IconData? icon;
  final String title;
  final String subtitle;
  final List<Widget>? bottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bottom = this.bottom;
    final header = this.header;

    return SliverPadding(
      padding: theme.sizes.asInsets.xl,
      sliver: MultiSliver(
        children: [
          const AppGap.xxl(isSliver: true),
          if (icon != null)
            Icon(
              icon,
              size: theme.sizes.xxxl + theme.sizes.m,
              color: theme.colors.secondary,
            ),
          if (header != null) header,
          const AppGap.xxs(isSliver: true),
          Padding(
            padding: theme.sizes.asInsets.s.horizontalOnly,
            child: AppText.titleSmall(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: theme.sizes.asInsets.xs,
            child: AppText.bodyMedium(
              subtitle,
              color: theme.colors.primaryLight,
              textAlign: TextAlign.center,
            ),
          ),
          if (bottom != null) ...[
            const AppGap.xxl(isSliver: true),
            ...bottom,
          ],
        ],
      ),
    );
  }
}
