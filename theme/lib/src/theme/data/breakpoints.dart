import 'package:flutter/material.dart';

/// Breakpoints data for the CDAppTheme
class ThemeBreakpointsData {
  /// Default constructor
  ThemeBreakpointsData({
    required this.verticalBreakpoint,
    required this.horizontalBreakpoint,
  });

  /// Instantiate ThemeBreakpointsData with `regular` data.
  const ThemeBreakpointsData.regular()
      : verticalBreakpoint = 900,
        horizontalBreakpoint = 720;

  /// Height breakpoint in responsive page for header size
  final double verticalBreakpoint;

  /// Width breakpoint in responsive page
  final double horizontalBreakpoint;
}

class ThemeBreakpointsDataExtension
    extends ThemeExtension<ThemeBreakpointsDataExtension> {
  const ThemeBreakpointsDataExtension({
    required this.breakpoints,
  });

  final ThemeBreakpointsData breakpoints;

  @override
  ThemeBreakpointsDataExtension copyWith({ThemeBreakpointsData? breakpoints}) {
    return ThemeBreakpointsDataExtension(
      breakpoints: breakpoints ?? this.breakpoints,
    );
  }

  @override
  ThemeBreakpointsDataExtension lerp(
    ThemeExtension<ThemeBreakpointsDataExtension>? other,
    double t,
  ) {
    final scopedOther = other as ThemeBreakpointsDataExtension?;
    return ThemeBreakpointsDataExtension(
      breakpoints: ThemeBreakpointsData(
        horizontalBreakpoint: t < 0.5
            ? breakpoints.horizontalBreakpoint
            : scopedOther?.breakpoints.horizontalBreakpoint ?? 0,
        verticalBreakpoint: t < 0.5
            ? breakpoints.verticalBreakpoint
            : scopedOther?.breakpoints.verticalBreakpoint ?? 0,
      ),
    );
  }
}
