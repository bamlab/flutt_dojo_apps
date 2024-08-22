import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/utils/named.dart';

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
      : xs = const Radius.circular(4),
        s = const Radius.circular(8),
        m = const Radius.circular(16);

  /// {@template cda.radius.xs}
  /// Value are:
  /// * 4 for `regular`
  /// {@endtemplate}
  final Radius xs;

  /// {@template cda.radius.s}
  /// Value are:
  /// * 8 for `regular`
  /// {@endtemplate}
  final Radius s;

  /// {@template cda.radius.m}
  /// Value are:
  /// * 16 for `regular`
  /// {@endtemplate}
  final Radius m;

  /// Return a new data class with the same values but expressed in
  /// [BorderRadius].
  ThemeBorderRadiusData get asBorderRadius => ThemeBorderRadiusData(this);

  @override
  List<Named<Radius>> get props => [
        xs.named('xs'),
        s.named('s'),
        m.named('m'),
      ];
}

class ThemeBorderRadiusData {
  const ThemeBorderRadiusData(this._radius);

  final ThemeRadiusData _radius;

  /// {@macro cda.radius.xs}
  BorderRadius get xs => BorderRadius.all(_radius.xs);

  /// {@macro cda.radius.s}
  BorderRadius get s => BorderRadius.all(_radius.s);

  /// {@macro cda.radius.m}
  BorderRadius get m => BorderRadius.all(_radius.m);
}

/// [ThemeExtension] for theme border radius providing the capability
/// to smoothly transition from a ThemeRadiusData to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeRadiusDataExtension
    extends ThemeExtension<ThemeRadiusDataExtension> {
  const ThemeRadiusDataExtension({required this.radius});

  final ThemeRadiusData radius;

  @override
  ThemeRadiusDataExtension copyWith({ThemeRadiusData? radius}) {
    return ThemeRadiusDataExtension(radius: radius ?? this.radius);
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
