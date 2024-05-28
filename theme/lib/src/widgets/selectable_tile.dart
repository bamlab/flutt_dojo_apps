import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

enum AppSelectableTileType {
  small,
  regular,
}

class AppSelectableTile extends StatelessWidget {
  const AppSelectableTile({
    required this.isSelected,
    required this.isDisabled,
    required this.onTap,
    required this.label,
    super.key,
    this.trailing,
    this.type = AppSelectableTileType.regular,
  }) : assert(
          !(isSelected && isDisabled),
          'A card cannot be selected and disabled',
        );

  final bool isSelected;
  final bool isDisabled;
  final void Function() onTap;
  final String label;
  final Widget? trailing;

  /// The type of the tile. Acts on the padding of the tile.
  ///
  /// Defaults to [AppSelectableTileType.regular].
  final AppSelectableTileType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final trailing = this.trailing;

    final padding = switch (type) {
      AppSelectableTileType.small => EdgeInsets.only(
          left: theme.sizes.xl,
          right: theme.sizes.m,
          top: theme.sizes.xxs,
          bottom: theme.sizes.xxs,
        ),
      AppSelectableTileType.regular =>
        theme.sizes.asInsets.m.copyWith(left: theme.sizes.xl),
    };

    return AppSelectableCard(
      isSelected: isSelected,
      isDisabled: isDisabled,
      onTap: onTap,
      builder: (
        context, {
        required isSelected,
        required isDisabled,
        animationDuration,
        onSurfaceColor,
      }) =>
          Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: theme.sizes.asInsets.xl.verticalOnly,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSelectableDot(
                      animationDuration: animationDuration = theme.durations.xs,
                      isSelected: isSelected,
                      borderColor: onSurfaceColor = () {
                        if (isDisabled || !isSelected) {
                          return theme.colors.grey200;
                        }
                        return theme.colors.colorsScheme.onSurface;
                      }(),
                    ),
                    const AppGap.xs(),
                    Flexible(
                      child: AppText.bodyLarge(
                        label,
                        overflow: TextOverflow.ellipsis,
                        color: isDisabled
                            ? theme.colors.colorsScheme.secondary
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (trailing != null) ...[
              const AppGap.xs(),
              trailing,
            ],
          ],
        ),
      ),
    );
  }
}
