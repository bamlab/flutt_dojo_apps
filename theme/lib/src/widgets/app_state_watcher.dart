import 'package:flutter/material.dart';

class AppStateWatcher extends StatefulWidget {
  const AppStateWatcher({
    required this.handleAppState,
    required this.child,
    super.key,
  });

  final void Function(
    AppLifecycleState? oldAppState,
    AppLifecycleState newAppState,
  ) handleAppState;
  final Widget child;

  @override
  State<AppStateWatcher> createState() => AppStateWatcherState();
}

class AppStateWatcherState extends State<AppStateWatcher>
    with
        // We do not want to override all WidgetsBindingObserver methods.
        // That's how it's done on the official doc, see:
        // https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html
        //
        // The rule prefer_mixin advise us to implement `WidgetsBindingObserver`
        // and calling `super`, but `WidgetsBindingObserver` is abstract so we
        // can't.
        //
        // See: https://dart-lang.github.io/linter/lints/prefer_mixin.html
        // ignore: prefer_mixin
        WidgetsBindingObserver {
  AppLifecycleState? _appState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.handleAppState(_appState, state);
    _appState = state;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
