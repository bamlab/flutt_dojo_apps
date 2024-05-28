import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/theme/themes_data.dart';

enum LineDirection {
  vertical,
  horizontal;

  bool get isVertical => this == LineDirection.vertical;
  bool get isHorizontal => this == LineDirection.horizontal;
}

class Line extends StatelessWidget {
  const Line({
    super.key,
    this.axis = LineDirection.vertical,
    this.size,
    this.color,
  });

  final LineDirection axis;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final lineSize = size ?? double.infinity;

    return Container(
      height: axis.isVertical ? lineSize : 1,
      width: axis.isHorizontal ? lineSize : 1,
      color: color ?? theme.colors.onBackground,
    );
  }
}
