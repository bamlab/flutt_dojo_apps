import 'package:flutter/material.dart';

import '../../cdapp_theme.dart';

enum SnackBarType {
  error,
  success,
  warning,
  info,
}

/// The color of the background of the snackbar.
Color _getBackgroundColor(BuildContext context, SnackBarType type) {
  switch (type) {
    case SnackBarType.error:
      return Theme.of(context).colors.onError;
    case SnackBarType.success:
      return Theme.of(context).colors.statusSuccess;
    case SnackBarType.warning:
      return Theme.of(context).colors.statusWarning;
    case SnackBarType.info:
      return Theme.of(context).colors.grey50;
  }
}

/// Show a Snackbar
ScaffoldFeatureController showSnackBar(
  BuildContext context, {
  String? title,
  required String message,
  required SnackBarType type,
  IconData? prefixIcon,

  /// Defaut value is `theme.sizes.l`
  double? bottomOffset,
  VoidCallback? onTap,
}) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: theme.durations.s,
      behavior: SnackBarBehavior.floating,
      padding: theme.sizes.asInsets.s,
      margin: EdgeInsets.only(
        bottom: bottomOffset ?? theme.sizes.l,
        top: theme.sizes.xs,
        left: theme.sizes.xs,
        right: theme.sizes.xs,
      ),
      backgroundColor: _getBackgroundColor(context, type),
      shape: RoundedRectangleBorder(
        borderRadius: theme.radius.asBorderRadius.s,
      ),
      content: SnackBarBody(
        title: title,
        message: message,
        prefixIcon: prefixIcon,
        type: type,
        onTap: onTap ?? ScaffoldMessenger.of(context).hideCurrentSnackBar,
      ),
    ),
  );
}

/// Put a wrapper arround the SnackBarBody to use
/// the snackbar notif without calling showSnackBar from
/// the [ScaffoldMessenger]
class SnackBarNotif extends StatelessWidget {
  /// Default constructor
  const SnackBarNotif({
    super.key,
    this.title,
    required this.message,
    required this.type,
    this.isLoading = false,
    this.prefixIcon,
    this.onTap,
  });

  /// The title of the snackbar. If null, no title is shown
  final String? title;

  /// The content, placed bellow the title
  final String message;

  /// The type of the snackbar
  final SnackBarType type;

  /// Display a loader in the snackbar
  final bool isLoading;

  /// The icon of the snackbar. If null, the icon is set according to the type
  final IconData? prefixIcon;

  /// A fonction called when the snackbar is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: theme.sizes.asInsets.s,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context, type),
        borderRadius: theme.radius.asBorderRadius.s,
      ),
      child: SnackBarBody(
        title: title,
        message: message,
        type: type,
        isLoading: isLoading,
        prefixIcon: prefixIcon,
        onTap: onTap,
      ),
    );
  }
}

/// Body of the SnackBar returned by [showSnackBar]
class SnackBarBody extends StatelessWidget {
  /// Default constructor
  const SnackBarBody({
    super.key,
    this.title,
    this.prefixIcon,
    required this.message,
    required this.type,
    this.isLoading = false,
    this.onTap,
  });

  /// The title of the snackbar. If null, no title is shown
  final String? title;

  /// The title of the snackbar. If null, the icon is set according to the type
  final IconData? prefixIcon;

  /// The content, placed bellow the title
  final String message;

  /// The type of the snackbar
  final SnackBarType type;

  /// Display a loader in the snackbar
  final bool isLoading;

  /// A fonction called when the snackbar is tapped
  final VoidCallback? onTap;

  /// The color of the elements of the snackbar.
  Color getOnBackgroundColor(BuildContext context) {
    switch (type) {
      case SnackBarType.error:
        return Theme.of(context).colors.onError;
      case SnackBarType.success:
        return Theme.of(context).colors.statusSuccess;
      case SnackBarType.warning:
        return Theme.of(context).colors.statusWarning;
      case SnackBarType.info:
        return Theme.of(context).colors.primary;
    }
  }

  /// The icon shown before the title and message.
  IconData get prefixIconByType {
    switch (type) {
      case SnackBarType.error:
        return ThemeIcons.triangleexclamation_regular;
      case SnackBarType.success:
        return ThemeIcons.check_regular;
      case SnackBarType.warning:
        return ThemeIcons.circleexclamation_regular;
      case SnackBarType.info:
        return ThemeIcons.circleinfo_regular;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = this.title;

    final content = Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            AppText.bodyLarge(
              title,
              color: getOnBackgroundColor(context),
              fontWeight: FontWeight.w600,
            ),
            const AppGap.xs(),
          ],
          AppText.bodyMedium(
            message,
            color: getOnBackgroundColor(context),
          ),
        ],
      ),
    );

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLoading)
            AppLoader.regular(color: getOnBackgroundColor(context))
          else
            Icon(
              prefixIcon ?? prefixIconByType,
              size: theme.sizes.xl,
              color: getOnBackgroundColor(context),
            ),
          const AppGap.xs(),
          content,
        ],
      ),
    );
  }
}
