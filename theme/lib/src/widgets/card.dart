import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/cdapp_theme.dart';

enum DividerType { gap, line, none }

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    required this.bottom,
    super.key,
    this.isBlured = false,
    this.trailing,
    this.leading,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.shape,
    this.crossAxisAlignmentBottom,
    this.crossAxisAlignment,
    this.leadingAxisAlignment,
    this.dividerType = DividerType.gap,
  });

  final Widget child;
  final Widget? trailing;
  final Widget? leading;
  final Widget? bottom;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final DividerType dividerType;
  final bool isBlured;

  /// Default to [ThemeData.sizes.asInsets.m]
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;

  /// Cross axis alignment for the bottom widget
  ///
  /// Default to [CrossAxisAlignment.start]
  final CrossAxisAlignment? crossAxisAlignmentBottom;

  /// Cross axis alignment for the main widget
  ///
  /// Default to [CrossAxisAlignment.start]
  final CrossAxisAlignment? crossAxisAlignment;

  /// Cross axis alignment for the leading widget
  ///
  /// If null Default to [crossAxisAlignment]
  final CrossAxisAlignment? leadingAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final leading = this.leading;
    final trailing = this.trailing;
    final bottom = this.bottom;

    final divider = switch (dividerType) {
      (DividerType.line) => Column(
          children: [
            const AppGap.xs(),
            Divider(
              thickness: 1,
              color: theme.colors.grey100,
            ),
            const AppGap.xs(),
          ],
        ),
      (DividerType.gap) => const AppGap.s(),
      (DividerType.none) => null,
    };

    final content = bottom != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                crossAxisAlignmentBottom ?? CrossAxisAlignment.start,
            children: [
              child,
              if (divider != null) divider,
              bottom,
            ],
          )
        : child;

    return Card(
      color: backgroundColor,
      shape: shape,
      child: AppTap(
        onTap: onTap,
        borderRadius: theme.radius.asBorderRadius.s,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isBlured ? 20 : 0,
            sigmaY: isBlured ? 20 : 0,
          ),
          child: Padding(
            padding: padding ?? theme.sizes.asInsets.m,
            child: trailing != null || leading != null
                ? Row(
                    crossAxisAlignment: leadingAxisAlignment ??
                        crossAxisAlignment ??
                        CrossAxisAlignment.start,
                    children: [
                      if (leading != null) leading,
                      Expanded(
                        child: Row(
                          crossAxisAlignment:
                              crossAxisAlignment ?? CrossAxisAlignment.start,
                          children: [
                            Expanded(child: content),
                            if (trailing != null) trailing,
                          ],
                        ),
                      ),
                    ],
                  )
                : content,
          ),
        ),
      ),
    );
  }
}
