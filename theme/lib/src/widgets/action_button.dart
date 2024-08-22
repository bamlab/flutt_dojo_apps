import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/theme/data/colors.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/loader.dart';
import 'package:flutter_bam_theme/src/widgets/tap.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    required this.onTap,
    required this.iconWidget,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.backgroundColor,
    this.borderColor,
    this.isLoading = false,
    super.key,
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

  static const _dimension = kMinInteractiveDimensionCupertino;
  static const _borderWidth = 1;

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
          dimension: _dimension,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: _borderWidth.toDouble(),
              ),
            ),
            child: isLoading
                ? AppLoader.regular(color: theme.colors.primary)
                : Center(child: iconWidget),
          ),
        ),
      ),
    );
  }
}
