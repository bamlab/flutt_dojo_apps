import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/gap.dart';

class AppTabBarContent extends Equatable {
  const AppTabBarContent({
    required this.title,
    required this.onTap,
    this.icon,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  List<Object?> get props => [title, icon, onTap];
}

// ignore: prefer-sliver-prefix , not necessarely a sliver widget
class AppTabBar extends StatelessWidget {
  const AppTabBar({
    required this.tabs,
    required this.isSliver,
    this.isScrollable = false,
    super.key,
  });

  final List<AppTabBarContent> tabs;
  final bool isSliver;
  final bool isScrollable;

  // ignore: prefer-widget-private-members, this is a static method
  static double getSize(BuildContext context) => Theme.of(context).sizes.xxxl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tabBar = Stack(
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
          onTap: (index) => tabs.elementAtOrNull(index)?.onTap(),
          isScrollable: isScrollable,
          tabAlignment: isScrollable ? TabAlignment.start : TabAlignment.fill,
          tabs: tabs
              .map(
                (tab) => Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (tab.icon != null) ...[
                        Icon(tab.icon),
                        const AppGap.xxs(),
                      ],
                      Flexible(
                        flex: isScrollable ? 0 : 1,
                        child: Text(
                          tab.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );

    if (!isSliver) {
      return tabBar;
    }

    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        minHeight: getSize(context),
        maxHeight: getSize(context),
        child: tabBar,
      ),
      pinned: true,
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
