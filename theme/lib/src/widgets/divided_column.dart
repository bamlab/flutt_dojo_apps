import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';

class DividedColumn extends StatelessWidget {
  const DividedColumn({
    required this.children,
    this.customSeparator,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    super.key,
  });

  final List<Widget> children;
  final Widget? customSeparator;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  List<Widget> _getSeparatedChildren(ThemeData theme) {
    final childrenIList = IList(children);

    final separator = customSeparator ??
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.sizes.xs,
            vertical: theme.sizes.xxs,
          ),
          child: const Divider(),
        );

    final childrenWithDividers =
        childrenIList.expand((child) => [child, separator]).toIList();

    return childrenWithDividers.removeLast().toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      // ignore: avoid-returning-widgets , TODO: Fix this
      children: _getSeparatedChildren(theme),
    );
  }
}
