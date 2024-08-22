import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/tap.dart';

class AppSelectableCard extends StatelessWidget {
  const AppSelectableCard({
    required this.isSelected,
    required this.isDisabled,
    required this.onTap,
    required this.builder,
    this.disabledSurfaceColor,
    this.disabledBorderColor,
    super.key,
  }) : assert(
          !isSelected || !isDisabled,
          'A card cannot be selected and disabled',
        );

  final bool isSelected;
  final bool isDisabled;
  final void Function() onTap;
  final Widget Function(
    BuildContext, {
    required bool isSelected,
    required bool isDisabled,
    Duration? animationDuration,
    Color? onSurfaceColor,
  }) builder;

  /// The color of the card when it is disabled.
  ///
  /// If not provided, the default value is [theme.colors.grey50].
  final Color? disabledSurfaceColor;

  /// The color of the border when the card is disabled.
  ///
  /// If not provided, the default value is [theme.colors.grey200].
  final Color? disabledBorderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final surfaceColor = () {
      if (isDisabled) {
        return disabledSurfaceColor ?? theme.colors.grey50;
      }

      return theme.colors.colorsScheme.surface;
    }();

    final onSurfaceColor = () {
      if (isDisabled || !isSelected) {
        return theme.colors.grey200;
      }

      return theme.colors.colorsScheme.onSurface;
    }();

    final borderColor = () {
      if (isDisabled) {
        return disabledBorderColor ?? theme.colors.grey200;
      }
      if (!isSelected) {
        return theme.colors.grey200;
      }

      return theme.colors.colorsScheme.onSurface;
    }();

    final borderRadius = theme.radius.asBorderRadius.s;

    final animationDuration = theme.durations.xs;

    return AppTap(
      borderRadius: borderRadius,
      onTap: !isSelected && !isDisabled ? onTap : null,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: surfaceColor,
          border: Border.all(width: theme.sizes.xxxs, color: borderColor),
          borderRadius: borderRadius,
        ),
        duration: animationDuration,
        child: builder(
          context,
          isSelected: isSelected,
          isDisabled: isDisabled,
          animationDuration: animationDuration,
          onSurfaceColor: onSurfaceColor,
        ),
      ),
    );
  }
}
