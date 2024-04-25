import 'package:flutter/material.dart';

/// Breakpoints data for the FlutterBamTheme
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

/// [ThemeExtension] for theme breakpoints providing the capability to
/// smoothly transition from a [ThemeBreakpointsData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeBreakpointsDataExtension
    extends ThemeExtension<ThemeBreakpointsDataExtension> {
  /// default constructor.
  const ThemeBreakpointsDataExtension({
    required this.breakpoints,
  });

  /// [ThemeBreakpointsData] which will be accessible through this theme
  /// extension
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
