import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../utils/named.dart';

/// Data class that holds every theme sizes.
class ThemeSizeData extends Equatable {
  /// default constructor.
  const ThemeSizeData({
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });

  /// Instantiate ThemeSizeData with `regular` data.
  const ThemeSizeData.regular()
      : xs = 8,
        s = 16,
        m = 32,
        l = 48,
        xl = 64;

  /// Value are:
  /// * 8 for `regular`
  final double xs;

  /// Value are:
  /// * 16 for `regular`
  final double s;

  /// Value are:
  /// * 32 for `regular`
  final double m;

  /// Value are:
  /// * 48 for `regular`
  final double l;

  /// Value are:
  /// * 64 for `regular`
  final double xl;

  /// Return a new data class with the same values but expressed in
  /// [EdgeInsets].
  ThemeEdgeInsetsSizeData get asInsets => ThemeEdgeInsetsSizeData(this);

  /// Props used in our test to link a size to its name
  @visibleForTesting
  List<Named<double>> get namedProps => [
        xs.named('xs'),
        s.named('s'),
        m.named('m'),
        l.named('l'),
        xl.named('xl'),
      ];

  @override
  List<double> get props => [
        xs,
        s,
        m,
        l,
        xl,
      ];
}

/// [ThemeExtension] for theme sizes providing the capability to
/// smoothly transition from a [ThemeSizeData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeSizeDataExtension extends ThemeExtension<ThemeSizeDataExtension> {
  /// default constructor.
  const ThemeSizeDataExtension({
    required this.sizes,
  });

  /// [ThemeSizeData] which will be accessible through this theme
  /// extension
  final ThemeSizeData sizes;

  @override
  ThemeSizeDataExtension copyWith({ThemeSizeData? sizes}) {
    return ThemeSizeDataExtension(
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  ThemeSizeDataExtension lerp(
    ThemeExtension<ThemeSizeDataExtension>? other,
    double t,
  ) {
    final scopedOther = other as ThemeSizeDataExtension?;
    return ThemeSizeDataExtension(
      sizes: ThemeSizeData(
        xs: lerpDouble(sizes.xs, scopedOther?.sizes.xs, t) ?? 0,
        s: lerpDouble(sizes.s, scopedOther?.sizes.s, t) ?? 0,
        m: lerpDouble(sizes.m, scopedOther?.sizes.m, t) ?? 0,
        l: lerpDouble(sizes.l, scopedOther?.sizes.l, t) ?? 0,
        xl: lerpDouble(sizes.xl, scopedOther?.sizes.xl, t) ?? 0,
      ),
    );
  }
}

/// Edge insets data for the FlutterBamTheme
class ThemeEdgeInsetsSizeData {
  /// default constructor.
  const ThemeEdgeInsetsSizeData(this._spacing);

  final ThemeSizeData _spacing;

  /// [EdgeInsets] xs getter linked to [ThemeSizeData.xs]
  EdgeInsets get xs => EdgeInsets.all(_spacing.xs);

  /// [EdgeInsets] xs getter linked to [ThemeSizeData.s]
  EdgeInsets get s => EdgeInsets.all(_spacing.s);

  /// [EdgeInsets] xs getter linked to [ThemeSizeData.m]
  EdgeInsets get m => EdgeInsets.all(_spacing.m);

  /// [EdgeInsets] xs getter linked to [ThemeSizeData.l]
  EdgeInsets get l => EdgeInsets.all(_spacing.l);

  /// [EdgeInsets] xs getter linked to [ThemeSizeData.xl]
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);
}
