import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// Add a [CupertinoScaffold] to be able to use
// [CupertinoScaffold.showCupertinoModalBottomSheet] later in the app
// and have the correct transition effect.
class AppCupertinoScaffold extends StatelessWidget {
  const AppCupertinoScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconTheme = IconTheme.of(context);

    return CupertinoScaffold(
      topRadius: theme.radius.m,
      // Because [CupertinoScaffold] adds a [CupertinoTheme] to the tree, which
      // adds an [IconTheme] with a fixed size, we need to override the
      // [IconTheme] with the correct one.
      // https://github.com/jamesblasco/modal_bottom_sheet/issues/346
      body: IconTheme(
        data: iconTheme,
        child: child,
      ),
    );
  }
}
