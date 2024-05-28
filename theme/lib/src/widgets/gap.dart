import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:gap/gap.dart';

@visibleForTesting
enum CdaGapSize {
  adaptiveBottom,
  xxxs,
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
  xxxl,
}

class _GapWrapper extends StatelessWidget {
  const _GapWrapper(
    this.mainAxisExtent, {
    required this.isSliver,
  });

  final bool isSliver;
  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return SliverGap(mainAxisExtent);
    }
    return Gap(mainAxisExtent);
  }
}

class AppGap extends StatelessWidget {
  /// adaptiveBottom Gap
  /// Used to add a bottom padding from the device's safe area.
  const AppGap.adaptiveBottom({
    super.key,
    this.isSliver = false,
  })  : size = CdaGapSize.adaptiveBottom,
        hasAdaptiveBottom = true;

  /// xxxs Gap
  ///
  /// regular: `2`
  const AppGap.xxxs({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.xxxs;

  /// xxs Gap
  ///
  /// regular: `4`
  const AppGap.xxs({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.xxs;

  /// xs Gap
  ///
  /// regular: '8'
  const AppGap.xs({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.xs;

  /// s Gap
  ///
  /// regular: '12'
  const AppGap.s({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.s;

  /// m Gap
  ///
  /// regular: '16'
  const AppGap.m({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.m;

  /// l Gap
  ///
  /// regular: '20'
  const AppGap.l({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.l;

  /// xl Gap
  ///
  /// regular: '24'
  const AppGap.xl({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.xl;

  /// xxl Gap
  ///
  /// regular: '32'
  const AppGap.xxl({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.xxl;

  /// xxxl Gap
  ///
  /// regular: '40'
  const AppGap.xxxl({
    super.key,
    this.isSliver = false,
    this.hasAdaptiveBottom = false,
  }) : size = CdaGapSize.xxxl;

  final CdaGapSize size;
  final bool isSliver;

  /// Add the safeArea bottom insets
  /// if not set in another SafeArea in the context
  final bool hasAdaptiveBottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bottomSafeArea =
        hasAdaptiveBottom ? MediaQuery.of(context).padding.bottom : 0;

    switch (size) {
      case CdaGapSize.adaptiveBottom:
        return _GapWrapper(0.0 + bottomSafeArea, isSliver: isSliver);
      case CdaGapSize.xxxs:
        return _GapWrapper(
          theme.sizes.xxxs + bottomSafeArea,
          isSliver: isSliver,
        );
      case CdaGapSize.xxs:
        return _GapWrapper(
          theme.sizes.xxs + bottomSafeArea,
          isSliver: isSliver,
        );
      case CdaGapSize.xs:
        return _GapWrapper(theme.sizes.xs + bottomSafeArea, isSliver: isSliver);
      case CdaGapSize.s:
        return _GapWrapper(theme.sizes.s + bottomSafeArea, isSliver: isSliver);
      case CdaGapSize.m:
        return _GapWrapper(theme.sizes.m + bottomSafeArea, isSliver: isSliver);
      case CdaGapSize.l:
        return _GapWrapper(theme.sizes.l + bottomSafeArea, isSliver: isSliver);
      case CdaGapSize.xl:
        return _GapWrapper(theme.sizes.xl + bottomSafeArea, isSliver: isSliver);
      case CdaGapSize.xxl:
        return _GapWrapper(
          theme.sizes.xxl + bottomSafeArea,
          isSliver: isSliver,
        );
      case CdaGapSize.xxxl:
        return _GapWrapper(
          theme.sizes.xxxl + bottomSafeArea,
          isSliver: isSliver,
        );
    }
  }
}
