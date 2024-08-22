import 'dart:async';

import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';

/// The duration of the animation to show the refresh indicator.
/// Similar to the RefreshIndicator widget.
const kIndicatorSnapDuration = Duration(milliseconds: 150);

/// A declarative [RefreshIndicator] alternative.
///
/// The API is inspired by [Switch] and [Checkbox]:
/// The indicator itself does not maintain any state. Instead, when the state of
/// the indicator changes, the widget calls the [onRefresh] callback. Most
/// widgets that use an indicator will listen for the [onRefresh] callback and
/// rebuild the indicator with a new [isRefreshing] value to show and hide it.
///
/// With the exception of [isRefreshing] and [onRefresh], all properties are
/// equivalent to [RefreshIndicator] properties or function arguments with the
/// same name.
class AppRefreshIndicator extends StatefulWidget {
  const AppRefreshIndicator({
    required this.child,
    required this.isRefreshing,
    required this.onRefresh,
    super.key,
    this.atTop = true,
    this.displacement,
    this.edgeOffset,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = 2,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  });

  /// Equivalent to [RefreshIndicator.child].
  final Widget child;

  /// Whether the indicator should be shown or hidden.
  ///
  /// `true` shows the indicator, and `false` hides it.
  ///
  /// Remember to rebuild the widget after modifying this value.
  ///
  /// See the [AppRefreshIndicator] for more information.
  final bool isRefreshing;

  /// Called when the user triggers a refresh.
  ///
  /// The indicator calls the callback and expects the parent widget to rebuild
  /// the indicator with [isRefreshing] set to `true`.
  ///
  /// See the [AppRefreshIndicator] for more information.
  final VoidCallback onRefresh;

  /// Equivalent to the `atTop` argument in [RefreshIndicatorState.show].
  ///
  /// Note: Changes to this value will not appear until the indicator is next
  /// shown.
  final bool atTop;

  /// Equivalent to [RefreshIndicator.displacement].
  final double? displacement;

  /// Equivalent to [RefreshIndicator.edgeOffset].
  final double? edgeOffset;

  /// Equivalent to [RefreshIndicator.color].
  final Color? color;

  /// Equivalent to [RefreshIndicator.backgroundColor].
  final Color? backgroundColor;

  /// Equivalent to [RefreshIndicator.notificationPredicate].
  final ScrollNotificationPredicate notificationPredicate;

  /// Equivalent to [RefreshIndicator.semanticsLabel].
  final String? semanticsLabel;

  /// Equivalent to [RefreshIndicator.semanticsValue].
  final String? semanticsValue;

  /// Equivalent to [RefreshIndicator.strokeWidth].
  final double strokeWidth;

  /// Equivalent to [RefreshIndicator.triggerMode].
  final RefreshIndicatorTriggerMode triggerMode;

  @override
  AppRefreshIndicatorState createState() => AppRefreshIndicatorState();
}

class AppRefreshIndicatorState extends State<AppRefreshIndicator> {
  /// The key used to start the [RefreshIndicator].
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  /// A [Completer] used to stop the [RefreshIndicator]
  Completer<void>? _completer;

  /// As showing the [RefreshIndicator] will always call its refresh callback,
  /// this boolean tells the callback if it should notify the callback given to
  /// the widget by the user.
  ///
  /// When it is true, showing the [RefreshIndicator]
  /// (interactively or programmatically) will call the given callback.
  var _onlyShow = false;

  /// When the [Completer] is not in use by the indicator, it must be `null`.
  /// If the completer is `null`, the indicator must be hidden.
  bool get _showing => _completer != null;

  /// Show the indicator without calling the given refresh callback.
  Future<void> _show() async {
    assert(!_showing, 'Show called, but already showing!');
    // Notify the [RefreshIndicator] callback that the real callback given to
    // this widget by the user should not be called; this is just cosmetic.
    _onlyShow = true;
    // Show the [RefreshIndicator].
    await _refreshIndicatorKey.currentState?.show(atTop: widget.atTop);
  }

  /// Hide the indicator.
  void _hide() {
    assert(_showing, 'Hide called, but not showing!');
    assert(
      !(_completer?.isCompleted ?? false),
      'The completer should never exist in a completed state!',
    );
    _completer?.complete();
    _completer = null;
  }

  @override
  void initState() {
    super.initState();
    // If the indicator should be shown initially, show it.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isRefreshing && !_showing) {
        await _show();
      } else if (!widget.isRefreshing && _showing) {
        _hide();
      }
    });
  }

  @override
  void didUpdateWidget(AppRefreshIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRefreshing) {
      // The indicator may have been shown already, if it was shown
      // interactively. If it hasn't, show it now.
      if (!_showing) {
        // ignore: avoid-async-call-in-sync-function , we are in didUpdateWidget
        _show();
      }
    } else {
      if (_showing) {
        _hide();
      }

      // Wait for the indicator showing animation to finish before hiding
      // it if necessary.
      Future.delayed(kIndicatorSnapDuration, () {
        if (mounted && _showing && !widget.isRefreshing) {
          _hide(); // coverage:ignore-line
        }
      });
    }
  }

  Future<void> _onRefresh() async {
    // If this callback was triggered for cosmetic purposes, don't call the
    // given refresh callback, and reset [_onlyShow] for future calls.
    if (_onlyShow) {
      _onlyShow = false;
    } else {
      widget.onRefresh();
    }

    // The completer should not exist at this point.
    // It's created here, and must complete before this callback can be
    // called again.
    assert(_completer == null, 'The completer should not exist');

    // Create the completer and use it.
    final completer = Completer<void>();
    _completer = completer;
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _onRefresh,
      displacement: widget.displacement ?? 40,
      edgeOffset: widget.edgeOffset ?? 0,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      notificationPredicate: widget.notificationPredicate,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      strokeWidth: widget.strokeWidth,
      triggerMode: widget.triggerMode,
      child: widget.child,
    );
  }
}

class AppLinearProgressIndicator extends StatelessWidget {
  const AppLinearProgressIndicator({
    required this.isRefreshing,
    super.key,
    this.color,
    this.backgroundColor,
    this.minHeight = 4,
  });

  final bool isRefreshing;
  final Color? color;

  /// The color of the background of the progress indicator.
  ///
  /// Defaults to [theme.colors.background].
  final Color? backgroundColor;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foregroundColor = color ?? theme.colors.primary;

    return ColoredBox(
      color: backgroundColor ?? theme.colors.background,
      child: isRefreshing
          ? LinearCappedProgressIndicator(
              color: foregroundColor,
              minHeight: minHeight,
              backgroundColor: foregroundColor.withOpacity(0.05),
            )
          : SizedBox(height: minHeight, width: double.infinity),
    );
  }
}

class SliverRefreshControl extends StatelessWidget {
  /// Create a new refresh control for inserting into a list of slivers.
  ///
  /// Can only be used in downward-scrolling vertical lists that overscrolls. In
  /// other words, refreshes can't be triggered with [Scrollable]s using
  /// [ClampingScrollPhysics] which is the default on Android. To allow
  /// overscroll on Android, use an overscrolling physics such as
  /// [BouncingScrollPhysics] or [AlwaysScrollableBouncingScrollPhysics].
  ///
  /// The [onRefresh] argument will be called when pulled far enough to trigger
  /// a refresh. It also trigger a HapticFeedback.
  const SliverRefreshControl({required this.onRefresh, super.key});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: () async => onRefresh(),
      builder: (context, _, __, ___, ____) => const SizedBox.shrink(),
    );
  }
}
