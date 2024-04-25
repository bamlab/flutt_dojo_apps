import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../utils/named.dart';

/// Data class that holds every theme radius.
class ThemeRadiusData extends Equatable {
  /// default constructor.
  const ThemeRadiusData({
    required this.xs,
    required this.s,
    required this.m,
  });

  /// Instantiate ThemeRadiusData with `regular` data.
  const ThemeRadiusData.regular()
      : xs = const Radius.circular(8),
        s = const Radius.circular(16),
        m = const Radius.circular(32);

  /// Value are:
  /// * 8 for `regular`
  final Radius xs;

  /// Value are:
  /// * 16 for `regular`
  final Radius s;

  /// Value are:
  /// * 32 for `regular`
  final Radius m;

  /// Return a new data class with the same values but expressed in
  /// [BorderRadius].
  ThemeBorderRadiusData get asBorderRadius => ThemeBorderRadiusData(this);

  /// Props used in our test to link a radius to its name
  @visibleForTesting
  List<Named<Radius>> get namedProps => [
        xs.named('xs'),
        s.named('s'),
        m.named('m'),
      ];

  @override
  List<Radius> get props => [
        xs,
        s,
        m,
      ];
}

/// Border radius data for the FlutterBamTheme
class ThemeBorderRadiusData {
  /// default constructor.
  const ThemeBorderRadiusData(this._radius);

  final ThemeRadiusData _radius;

  /// [BorderRadius] xs getter linked to [ThemeRadiusData.xs]
  BorderRadius get xs => BorderRadius.all(_radius.xs);

  /// [BorderRadius] xs getter linked to [ThemeRadiusData.s]
  BorderRadius get s => BorderRadius.all(_radius.s);

  /// [BorderRadius] xs getter linked to [ThemeRadiusData.m]
  BorderRadius get m => BorderRadius.all(_radius.m);
}

/// [ThemeExtension] for theme border radius providing the capability to
/// smoothly transition from a [ThemeRadiusData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeRadiusDataExtension
    extends ThemeExtension<ThemeRadiusDataExtension> {
  /// default constructor.
  const ThemeRadiusDataExtension({
    required this.radius,
  });

  /// [ThemeRadiusData] which will be accessible through this theme
  /// extension
  final ThemeRadiusData radius;

  @override
  ThemeRadiusDataExtension copyWith({ThemeRadiusData? radius}) {
    return ThemeRadiusDataExtension(
      radius: radius ?? this.radius,
    );
  }

  @override
  ThemeRadiusDataExtension lerp(
    ThemeExtension<ThemeRadiusDataExtension>? other,
    double t,
  ) {
    final scopedOther = other as ThemeRadiusDataExtension?;
    return ThemeRadiusDataExtension(
      radius: ThemeRadiusData(
        xs: Radius.lerp(radius.xs, scopedOther?.radius.xs, t) ?? Radius.zero,
        s: Radius.lerp(radius.s, scopedOther?.radius.s, t) ?? Radius.zero,
        m: Radius.lerp(radius.m, scopedOther?.radius.m, t) ?? Radius.zero,
      ),
    );
  }
}
