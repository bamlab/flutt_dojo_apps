import 'package:flutter_bam_theme/cdapp_theme.dart';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showAppModal({
  required BuildContext context,
  required Widget child,

  /// The route name of the modal.
  ///
  /// This is used to identify the modal in the navigation stack and
  /// for analytics purpose.
  required String routeName,
  bool scrollable = false,
  CrossAxisAlignment? crossAxisAlignment,

  /// Duration of the modal opening animation.
  ///
  /// Default to [ThemeDurationsData.xs]
  Duration? duration,
}) {
  final theme = Theme.of(context);
  return showMaterialModalBottomSheet<void>(
    context: context,
    backgroundColor: theme.colors.transparent,
    useRootNavigator: true,
    duration: duration ?? theme.durations.xs,
    settings: RouteSettings(name: routeName),
    builder: (context) => AppModal(
      scrollable: scrollable,
      crossAxisAlignment: crossAxisAlignment,
      child: child,
    ),
  );
}

Future<T?> showAppModalWithResult<T>({
  required BuildContext context,
  required Widget child,
  bool scrollable = false,
  CrossAxisAlignment? crossAxisAlignment,

  /// Duration of the modal opening animation.
  ///
  /// Default to [ThemeDurationsData.xs]
  Duration? duration,
}) {
  final theme = Theme.of(context);
  return showMaterialModalBottomSheet<T>(
    context: context,
    backgroundColor: theme.colors.transparent,
    useRootNavigator: true,
    duration: duration ?? theme.durations.xs,
    builder: (context) => AppModal(
      scrollable: scrollable,
      crossAxisAlignment: crossAxisAlignment,
      child: child,
    ),
  );
}

class AppModal extends StatelessWidget {
  const AppModal({
    super.key,
    this.scrollable = false,
    required this.child,
    this.showTopBar = true,
    this.crossAxisAlignment,
  });

  final bool scrollable;
  final Widget child;
  final bool showTopBar;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: mediaQuery.size.height * 0.90),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: theme.radius.m,
          topRight: theme.radius.m,
        ),
        child: Material(
          color: theme.colors.background,
          child: ConditionnalWrapper(
            hasWrapper: scrollable,
            wrapperbuilder: (child) => SingleChildScrollView(child: child),
            child: showTopBar
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                        crossAxisAlignment ?? CrossAxisAlignment.center,
                    children: [
                      const AppGap.m(),
                      const TopModalBar(),
                      const AppGap.m(),
                      child,
                    ],
                  )
                : child,
          ),
        ),
      ),
    );
  }
}

class TopModalBar extends StatelessWidget {
  const TopModalBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: Container(
            height: theme.sizes.xxs,
            decoration: BoxDecoration(
              color: theme.colors.grey50,
              borderRadius: theme.radius.asBorderRadius.xs,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
