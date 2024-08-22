import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/gap.dart';

class AppTabBarRoundedIcons extends StatelessWidget {
  const AppTabBarRoundedIcons({required this.icons, super.key});

  static const _tabBarHeight = 48.0;

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tabsWidth = (icons.length * _IconMarker._markerDimension) +
        ((icons.length - 1) *
            (theme.tabBarTheme.labelPadding?.horizontal ?? 0));

    final shouldOverflow = tabsWidth > MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        // Using a Stack instead of wrapping the TabBar in a Container for the
        // bottom border to be aligned with the tab bar indicator.
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colors.background,
              border: Border(
                bottom: BorderSide(
                  color: theme.colors.grey50,
                  width: theme.sizes.xxxs,
                ),
              ),
            ),
          ),
        ),
        TabBar(
          labelColor: theme.colors.onPrimary,
          unselectedLabelColor: theme.colors.primary,
          isScrollable: shouldOverflow,
          tabs: icons.map((icon) {
            return Tab(
              height: _tabBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: shouldOverflow ? 0 : 1,
                    child: Column(
                      children: [
                        _IconMarker(
                          icon: icon,
                          labelColor: theme.colors.primary,
                          unselectedLabelColor: theme.colors.onPrimary,
                        ),
                        const AppGap.xs(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _IconMarker extends StatelessWidget {
  const _IconMarker({
    required this.icon,
    required this.labelColor,
    required this.unselectedLabelColor,
  });

  final IconData icon;
  final Color labelColor;
  final Color unselectedLabelColor;

  static const _borderWidth = 1.5;
  static const _markerDimension = 40.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currentColor = IconTheme.of(context).color ?? labelColor;

    final boxDecorationColor = currentColor == labelColor
        ? unselectedLabelColor
        : Color(labelColor.value - currentColor.value);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.square(
          dimension: _markerDimension,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: boxDecorationColor,
              shape: BoxShape.circle,
              border: Border.all(color: currentColor, width: _borderWidth),
            ),
          ),
        ),
        Positioned.fill(
          child: FittedBox(
            child: Padding(
              padding: theme.sizes.asInsets.xs,
              child: Icon(icon),
            ),
          ),
        ),
      ],
    );
  }
}
