import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/cdapp_theme.dart';

class DividedWrap extends StatelessWidget {
  DividedWrap({
    required this.children,
    super.key,
    this.customSeparator,
    this.runAlignement = WrapAlignment.start,
    this.alignment = WrapAlignment.start,
    this.direction = Axis.horizontal,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = WrapCrossAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.dividerHeight = 0,
  }) : assert(children.isNotEmpty, 'children must not be empty');

  final List<Widget> children;
  final Widget? customSeparator;

  final WrapAlignment runAlignement;
  final Axis direction;
  final WrapAlignment alignment;
  final MainAxisSize mainAxisSize;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;
  final double dividerHeight;

  List<Widget> getSeparatedChildren(ThemeData theme) {
    final childrenIList = IList(children);

    final separator = SizedBox(
      height: dividerHeight,
      child: customSeparator ??
          VerticalDivider(
            color: theme.colors.grey50,
          ),
    );

    final childrenWithDividers = childrenIList
        .expand(
          (child) => [child, separator],
        )
        .toIList();

    return childrenWithDividers.removeLast().toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: theme.sizes.xs,
      clipBehavior: clipBehavior,
      alignment: alignment,
      direction: direction,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      runAlignment: runAlignement,
      children: getSeparatedChildren(theme),
    );
  }
}
