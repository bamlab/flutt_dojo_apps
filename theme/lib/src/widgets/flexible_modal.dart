import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

const kModalInitialHeightFraction = 0.42;

class AppFlexibleModal extends StatelessWidget {
  const AppFlexibleModal({
    required this.scrollController,
    required this.scrollExtent,
    required this.child,
    this.initialHeightFraction = kModalInitialHeightFraction,
    this.onBackButtonPressed,
    super.key,
  });

  final ScrollController scrollController;
  final double scrollExtent;
  final Widget child;
  final double initialHeightFraction;
  final VoidCallback? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final safeAreaTopPadding =
        MediaQuery.of(Scaffold.of(context).context).viewPadding.top;

    final isFullScreen = scrollExtent > 0.7;

    final topAppBarPadding = max<double>(
      (safeAreaTopPadding / (1 - initialHeightFraction)) * scrollExtent +
          safeAreaTopPadding *
              initialHeightFraction /
              (initialHeightFraction - 1),
      0,
    );

    // Same as topAppBarPadding but for the bottom and with a max of
    // theme.sizes.xl
    final bottomAppBarPadding = max<double>(
      (theme.sizes.xl / (1 - initialHeightFraction)) * scrollExtent +
          theme.sizes.xl * initialHeightFraction / (initialHeightFraction - 1),
      0,
    );

    // theme.radius.m when scrollExtent is initialHeightFraction.
    // Radius.zero when scrollExtent is 1.
    // Min to theme.radius.m.
    final modalRadius = Radius.circular(
      min(
        theme.sizes.m,
        lerpDouble(
              theme.sizes.m,
              0,
              (scrollExtent - initialHeightFraction) /
                  (1 - initialHeightFraction),
            ) ??
            0,
      ),
    );

    final appBarPadding = EdgeInsets.only(
      top: topAppBarPadding,
      bottom: bottomAppBarPadding,
    );
    // Using will pop scope instead of dispose to fire the map padding
    // animation while the modal is closing.
    // Otherwise, the animation is fired when the modal is already closed.
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: modalRadius),
        color: theme.colors.background,
      ),
      // Using a [CustomScrollView] as this is the only way to have a
      // scrollable modal.
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                // Top modal bar if modal is not full screen
                AnimatedOpacity(
                  opacity: isFullScreen ? 0 : 1,
                  duration: theme.durations.xxs,
                  child: const Column(
                    children: [
                      AppGap.m(),
                      TopModalBar(),
                      AppGap.m(),
                    ],
                  ),
                ),
                Padding(
                  padding: appBarPadding,
                  // Back button if modal is in full screen
                  child: AnimatedOpacity(
                    opacity: isFullScreen ? 1 : 0,
                    duration: theme.durations.xxs,
                    child: Padding(
                      padding: theme.cupertinoNavigationBarTheme.padding,
                      child: AppActionButton(
                        onTap: onBackButtonPressed,
                        iconWidget: Icon(
                          ThemeIcons.angleleft_regular,
                          color: theme.colors.primary,
                          size: theme.sizes.xl,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: child,
          ),
          const AppGap.xxl(
            hasAdaptiveBottom: true,
            isSliver: true,
          ),
        ],
      ),
    );
  }
}
