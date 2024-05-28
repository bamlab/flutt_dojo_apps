import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/cdapp_theme.dart';

/// A view to display an error message to the user.
///
/// Additionally, it can display a button to retry or redirect.
class AppErrorView extends StatelessWidget {
  const AppErrorView({
    required this.title,
    this.message,
    this.icon,
    this.bottomWidget,
    this.isRefreshing = false,
    this.color,
    super.key,
  });

  final Color? color;
  final String title;
  final String? message;

  /// The icon to be displayed at the top of the view.
  /// Defaults to [ThemeIcons.triangleexclamation_regular].
  final IconData? icon;

  /// The widget to show below the message, for example a
  /// button to retry or redirect.
  /// If null, nothing will be shown.
  final Widget? bottomWidget;

  final bool isRefreshing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bottomWidget = this.bottomWidget ?? const SizedBox.shrink();
    final message = this.message;

    return Center(
      child: Padding(
        padding: theme.sizes.asInsets.xxl.horizontalOnly,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              color: color,
              icon ?? ThemeIcons.triangleexclamation_regular,
              size: 2 * theme.sizes.xl,
            ),
            const AppGap.m(),
            AppText.titleSmall(
              color: color,
              title,
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const AppGap.xs(),
              AppText.bodyMedium(
                message,
                textAlign: TextAlign.center,
                color: color ?? theme.colors.primaryLight,
              ),
            ],
            const AppGap.m(),
            bottomWidget,
          ],
        ),
      ),
    );
  }
}
