import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cdapp_theme.dart';
import '../theme/data/colors.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    required this.iconWidget,
    this.backgroundColor,
    this.borderColor,
    this.isLoading = false,
  });

  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final Widget iconWidget;

  /// The color of the border.
  /// Defaults to [ThemeColorsData.primary].
  final Color? borderColor;

  /// The background color inside the circle.
  /// Defaults to [ThemeColorsData.background].
  final Color? backgroundColor;

  /// Whether the button is in the loading state.
  final bool isLoading;

  static const dimension = kMinInteractiveDimensionCupertino;
  static const borderWidth = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = this.borderColor ?? theme.colors.primary;

    return ClipOval(
      child: AppTap(
        onTap: isLoading ? null : onTap,
        backgroundColor: backgroundColor,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        fit: BoxFit.cover,
        child: SizedBox.square(
          dimension: dimension,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: borderWidth.toDouble(),
              ),
            ),
            child: isLoading
                ? AppLoader.regular(
                    color: theme.colors.primary,
                  )
                : Center(child: iconWidget),
          ),
        ),
      ),
    );
  }
}
