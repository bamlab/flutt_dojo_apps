import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class AppDismissiblePage extends StatelessWidget {
  const AppDismissiblePage({
    super.key,
    required this.pageKey,
    required this.child,
  });

  /// The key for the DismissiblePage.
  ///
  /// Providing a key ensures that the child widget is not rebuilt when the
  /// user starts a gesture to dismiss the [DismissiblePage].
  final Key pageKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        // Add an empty AppBar below the DismissiblePage to handle
        // the status bar color.
        AppBar(automaticallyImplyLeading: false),
        DismissiblePage(
          key: pageKey,
          direction: DismissiblePageDismissDirection.down,
          backgroundColor: theme.colors.background,
          onDismissed: Navigator.of(context).pop,
          maxTransformValue: 0,
          child: child,
        ),
      ],
    );
  }
}
