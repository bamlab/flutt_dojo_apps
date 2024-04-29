import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cdapp_theme.dart';
import '../theme/data/colors.dart';

class AppTap extends StatelessWidget {
  const AppTap({
    super.key,
    required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.fit,
    this.enableMinSize = true,
    this.borderRadius,
    this.backgroundColor,
    this.splashFactory,
    required this.child,
  });

  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final BoxFit? fit;
  final bool enableMinSize;
  final InteractiveInkFeatureFactory? splashFactory;

  /// The border radius of the tap.
  /// If null, no border radius will be applied.
  final BorderRadius? borderRadius;

  /// The background color of the wrapped widget.
  /// Defaults to [ThemeColorsData.transparent].
  final Color? backgroundColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fit = this.fit;
    var child = this.child;

    if (enableMinSize) {
      child = ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: kMinInteractiveDimensionCupertino,
          minWidth: kMinInteractiveDimensionCupertino,
        ),
        child: child,
      );
    }

    final tapContent = Material(
      color: backgroundColor ?? theme.colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashFactory: splashFactory,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        borderRadius: borderRadius,
        child: child,
      ),
    );

    var tap = borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: tapContent,
          )
        : tapContent;

    if (fit != null) {
      tap = FittedBox(
        fit: fit,
        child: tap,
      );
    }

    return tap;
  }
}
