import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_bam_theme/src/theme/data/cupertino_navigation_bar_theme.dart';

const kNavBarLargeTitleHeightExtension = 52;

double getSliverThemeAppBarMaxHeight(BuildContext context) {
  return kNavBarLargeTitleHeightExtension +
      getSliverThemeAppBarMinHeight(context);
}

double getSliverThemeAppBarMinHeight(BuildContext context) {
  return kMinInteractiveDimensionCupertino + MediaQuery.of(context).padding.top;
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

    final title = this.title;

    return isSliver
        ? CupertinoSliverNavigationBar(
            alwaysShowMiddle: alwaysShowMiddle,
            // The [CupertinoSliverNavigationBar] uses the
            // [CupertinoTextThemeData]'s [navTitleTextStyle] and
            // [CupertinoTextThemeData] to set the style of
            // the [largeTitle] text.
            largeTitle: title != null
                ? GestureDetector(
                    onTap: onTap,
                    child: isSelectable
                        ? SelectableText(
                            title.toUpperCase(),
                          )
                        : Text(
                            title.toUpperCase(),
                          ),
                  )
                : titleWidget,
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
          )
        : CupertinoNavigationBar(
            leading: leading ?? defaultThemeLeading,
            automaticallyImplyLeading: automaticallyImplyLeading,
            previousPageTitle: previousPageTitle,
            middle: title != null
                ? isSelectable
                    ? SelectableText(title.toUpperCase())
                    : Text(title.toUpperCase())
                : middle,
            trailing: trailing,
            backgroundColor: backgroundColor,
            border: border ?? theme.cupertinoNavigationBarTheme.border,
            brightness: brightness,
            padding: padding ?? theme.cupertinoNavigationBarTheme.padding,
            transitionBetweenRoutes: transitionBetweenRoutes,
          );
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
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.of(context).maybePop();
      },
    );
  }
}
