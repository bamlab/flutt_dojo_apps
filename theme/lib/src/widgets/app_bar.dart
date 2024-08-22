import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/theme/data/cupertino_navigation_bar_theme.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/utils/helpers.dart';
import 'package:flutter_bam_theme/src/widgets/action_button.dart';
import 'package:flutter_bam_theme/src/widgets/icons.g.dart';

const kNavBarLargeTitleHeightExtension = 52;

double getSliverThemeAppBarMaxHeight(BuildContext context) {
  return kNavBarLargeTitleHeightExtension +
      getSliverThemeAppBarMinHeight(context);
}

double getSliverThemeAppBarMinHeight(BuildContext context) {
  return kMinInteractiveDimensionCupertino + MediaQuery.paddingOf(context).top;
}

/// A [CupertinoSliverNavigationBar] with a [backgroundColor]
/// background color.
///
/// This widget must be used as a sliver in a [CustomScrollView] and must be a
/// descendant of a [CupertinoPageScaffold].
class ThemeAppBar extends StatelessWidget {
  const ThemeAppBar({
    super.key,
    this.title,
    this.onTap,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.backgroundColor,
    this.brightness,
    this.padding,
    this.border,
    this.transitionBetweenRoutes = true,
    this.stretch = false,
    this.isSliver = false,
    this.isSelectable = false,
    this.alwaysShowMiddle = false,
    this.titleWidget,
  })  : assert(
          !isSelectable || onTap == null,
          'title can not be selectable and tappable at the same time',
        ),
        assert(
          titleWidget == null || title == null,
          'title and titleWidget can not be provided at the same time',
        ),
        assert(
          isSliver || titleWidget == null,
          'titleWidget must only be used for sliver app bar',
        );

  /// The primary content of the app bar.
  final String? title;

  /// A callback that's called when the app bar is tapped.
  final VoidCallback? onTap;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.leading}
  ///
  /// This widget is visible in both collapsed and expanded states.
  final Widget? leading;

  ///{@macro flutter.cupertino.CupertinoNavigationBar.automaticallyImplyLeading}
  /// Defaults to true.
  final bool automaticallyImplyLeading;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.previousPageTitle}
  final String? previousPageTitle;

  /// A widget to place in the middle of the static navigation bar instead of
  /// the [title].
  ///
  /// This widget is visible in both collapsed and expanded states. The text
  /// supplied in [title] will no longer appear in collapsed state if a
  /// [middle] widget is provided.
  final Widget? middle;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.trailing}
  ///
  /// This widget is visible in both collapsed and expanded states.
  final Widget? trailing;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.backgroundColor}
  final Color? backgroundColor;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.brightness}
  final Brightness? brightness;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.padding}
  /// Defaults to [CupertinoNavigationBarTheme.padding].
  final EdgeInsetsDirectional? padding;

  /// The border of the navigation bar.
  ///
  /// Default is [CupertinoNavigationBarTheme.border].
  final Border? border;

  /// {@macro flutter.cupertino.CupertinoNavigationBar.transitionBetweenRoutes}
  /// Defaults to true.
  final bool transitionBetweenRoutes;

  /// Whether the nav bar should stretch to fill the over-scroll area.
  ///
  /// The nav bar can still expand and contract as the user scrolls, but it will
  /// also stretch when the user over-scrolls if the [stretch] value is `true`.
  ///
  /// When set to `true`, the nav bar will prevent subsequent slivers from
  /// accessing overscrolls. This may be undesirable for using overscroll-based
  /// widgets like the [CupertinoSliverRefreshControl].
  ///
  /// Defaults to `false`.
  final bool stretch;

  final bool isSliver;

  /// Whether the title text should be selectable.
  ///
  /// Defaults to `false`.
  final bool isSelectable;

  /// The widget display as a title in the sliver app bar.
  final Widget? titleWidget;

  /// This property is only used in sliver app bar.
  ///
  /// Controls whether [middle] widget should always be visible
  /// (even in expanded state).
  ///
  /// If true (default) and [middle] is not null,
  /// [middle] widget is always visible.
  ///
  /// If false,
  /// [middle] widget is visible only in collapsed state if it is provided.
  ///
  /// This should be set to false if you only want to show [titleWidget]
  ///  in expanded state and [middle] in collapsed state.
  final bool alwaysShowMiddle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultThemeLeading = shouldShowBackButton(
      context,
      automaticallyImplyLeading: automaticallyImplyLeading,
    )
        ? const DefaultAppLeading()
        : null;

    final middle = this.middle;

    if (isSliver) {
      final titleWidget = this.titleWidget;

      return CupertinoSliverNavigationBar(
        heroTag: 'theme_app_bar',
        alwaysShowMiddle: alwaysShowMiddle,
        // The [CupertinoSliverNavigationBar] uses the
        // [CupertinoTextThemeData]'s [navTitleTextStyle] and
        // [CupertinoTextThemeData] to set the style of
        // the [largeTitle] text.
        largeTitle: titleWidget != null
            ? _AppBarTitle(
                title: title,
                isSelectable: isSelectable,
                onTap: onTap,
                fallbackWidget: titleWidget,
              )
            : null,
        leading: leading ?? defaultThemeLeading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        previousPageTitle: previousPageTitle,
        middle: middle,
        trailing: trailing,
        backgroundColor: backgroundColor,
        brightness: brightness,
        padding: padding ?? theme.cupertinoNavigationBarTheme.padding,
        border: border ?? theme.cupertinoNavigationBarTheme.border,
        transitionBetweenRoutes: transitionBetweenRoutes,
        stretch: stretch,
      );
    }

    return CupertinoNavigationBar(
      heroTag: 'theme_app_bar',
      leading: leading ?? defaultThemeLeading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      previousPageTitle: previousPageTitle,
      middle: middle != null
          ? _AppBarTitle(
              fallbackWidget: middle,
              isSelectable: isSelectable,
              title: title,
            )
          : null,
      trailing: trailing,
      backgroundColor: backgroundColor,
      border: border ?? theme.cupertinoNavigationBarTheme.border,
      brightness: brightness,
      padding: padding ?? theme.cupertinoNavigationBarTheme.padding,
      transitionBetweenRoutes: transitionBetweenRoutes,
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    required this.isSelectable,
    required this.fallbackWidget,
    this.title,
    this.onTap,
  });

  final String? title;
  final VoidCallback? onTap;
  final bool isSelectable;
  final Widget fallbackWidget;

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    if (title != null) {
      return GestureDetector(
        onTap: onTap,
        child: isSelectable
            ? SelectableText(title.toUpperCase())
            : Text(title.toUpperCase()),
      );
    }

    return fallbackWidget;
  }
}

class DefaultAppLeading extends StatelessWidget {
  const DefaultAppLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppActionButton(
      iconWidget: Icon(
        ThemeIcons.angleleft_regular,
        color: theme.colors.primary,
        size: theme.sizes.xl,
      ),
      backgroundColor: theme.colors.background,
      onTap: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        await Navigator.of(context).maybePop();
      },
    );
  }
}
