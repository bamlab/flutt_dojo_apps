import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../cdapp_theme.dart';

class AppTabBarContent extends Equatable {
  const AppTabBarContent({
    required this.title,
    this.icon,
    required this.onTap,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  List<Object?> get props => [title, icon, onTap];
}

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
    required this.isSliver,
    this.isScrollable = false,
  });

  final List<AppTabBarContent> tabs;
  final bool isSliver;
  final bool isScrollable;

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
          onTap: (index) => tabs[index].onTap(),
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
  SliverAppBarDelegate({
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
