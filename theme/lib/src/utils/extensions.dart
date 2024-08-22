import 'dart:math';

import 'package:flutter/material.dart';

extension WithSeparatorBuilder on SliverChildBuilderDelegate {
  SliverChildBuilderDelegate withSeparatorBuilder(
    IndexedWidgetBuilder separatorBuilder,
  ) {
    final childCount = this.childCount;

    return SliverChildBuilderDelegate(
      (context, index) {
        final itemIndex = index ~/ 2;

        return index.isEven
            ? builder(context, itemIndex)
            : separatorBuilder(context, itemIndex);
      },
      findChildIndexCallback: findChildIndexCallback,
      childCount:
          childCount != null ? _computeActualChildCount(childCount) : null,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      semanticIndexCallback: (widget, index) {
        return index.isEven ? semanticIndexCallback(widget, index ~/ 2) : null;
      },
      semanticIndexOffset: semanticIndexOffset,
    );
  }

  // Helper method to compute the actual child count for the separated
  // constructor.
  static int _computeActualChildCount(int itemCount) {
    return max(0, itemCount * 2 - 1);
  }
}
