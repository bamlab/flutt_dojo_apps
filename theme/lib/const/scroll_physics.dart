// coverage:ignore-file
import 'package:flutter/material.dart';

class AlwaysScrollableBouncingScrollPhysics extends BouncingScrollPhysics {
  /// The standard scroll physics for the app.
  ///
  /// It provided overscoll and it's always scrollable.
  const AlwaysScrollableBouncingScrollPhysics()
      : super(parent: const AlwaysScrollableScrollPhysics());
}
