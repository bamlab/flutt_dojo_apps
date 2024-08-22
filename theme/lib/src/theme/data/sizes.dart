import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/utils/named.dart';

/// Data class that holds every theme sizes.
class ThemeSizeData extends Equatable {
  /// default constructor.
  const ThemeSizeData({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
    required this.xxxl,
  });

  /// Instantiate ThemeSizeData with `regular` data.
  const ThemeSizeData.regular()
      : xxxs = 2,
        xxs = 4,
        xs = 8,
        s = 12,
        m = 16,
        l = 20,
        xl = 24,
        xxl = 32,
        xxxl = 40;

  /// {@template cda.sizes.xxxs}
  /// Value are:
  /// * 2 for `regular`
  /// {@endtemplate}
  final double xxxs;

  /// {@template cda.sizes.xxs}
  /// Value are:
  /// * 4 for `regular`
  /// {@endtemplate}
  final double xxs;

  /// {@template cda.sizes.xs}
  /// Value are:
  /// * 8 for `regular`
  /// {@endtemplate}
  final double xs;

  /// {@template cda.sizes.s}
  /// Value are:
  /// * 12 for `regular`
  /// {@endtemplate}
  final double s;

  /// {@template cda.sizes.m}
  /// Value are:
  /// * 16 for `regular`
  /// {@endtemplate}
  final double m;

  /// {@template cda.sizes.l}
  /// Value are:
  /// * 20 for `regular`
  /// {@endtemplate}
  final double l;

  /// {@template cda.sizes.xl}
  /// Value are:
  /// * 24 for `regular`
  /// {@endtemplate}
  final double xl;

  /// {@template cda.sizes.xxl}
  /// Value are:
  /// * 32 for `regular`
  /// {@endtemplate}
  final double xxl;

  /// {@template cda.sizes.xxxl}
  /// Value are:
  /// * 40 for `regular`
  /// {@endtemplate}
  final double xxxl;

  /// Return a new data class with the same values but expressed in
  /// [EdgeInsets].
  ThemeEdgeInsetsSizeData get asInsets => ThemeEdgeInsetsSizeData(this);

  @override
  List<Named<double>> get props => [
        xxxs.named('xxxs'),
        xxs.named('xxs'),
        xs.named('xs'),
        s.named('s'),
        m.named('m'),
        l.named('l'),
        xl.named('xl'),
        xxl.named('xxl'),
        xxxl.named('xxxl'),
      ];
}

class ThemeSizeDataExtension extends ThemeExtension<ThemeSizeDataExtension> {
  const ThemeSizeDataExtension({required this.sizes});

  final ThemeSizeData sizes;

  @override
  ThemeSizeDataExtension copyWith({ThemeSizeData? sizes}) {
    return ThemeSizeDataExtension(sizes: sizes ?? this.sizes);
  }

  @override
  ThemeSizeDataExtension lerp(
    ThemeExtension<ThemeSizeDataExtension>? other,
    double t,
  ) {
    final scopedOther = other as ThemeSizeDataExtension?;

    return ThemeSizeDataExtension(
      sizes: ThemeSizeData(
        xxxs: lerpDouble(sizes.xxxs, scopedOther?.sizes.xxxs ?? 0, t) ?? 0,
        xxs: lerpDouble(sizes.xxs, scopedOther?.sizes.xxs, t) ?? 0,
        xs: lerpDouble(sizes.xs, scopedOther?.sizes.xs, t) ?? 0,
        s: lerpDouble(sizes.s, scopedOther?.sizes.s, t) ?? 0,
        m: lerpDouble(sizes.m, scopedOther?.sizes.m, t) ?? 0,
        l: lerpDouble(sizes.l, scopedOther?.sizes.l, t) ?? 0,
        xl: lerpDouble(sizes.xl, scopedOther?.sizes.xl, t) ?? 0,
        xxl: lerpDouble(sizes.xxl, scopedOther?.sizes.xxl, t) ?? 0,
        xxxl: lerpDouble(sizes.xxxl, scopedOther?.sizes.xxxl, t) ?? 0,
      ),
    );
  }
}

class ThemeEdgeInsetsSizeData {
  const ThemeEdgeInsetsSizeData(this._spacing);

  final ThemeSizeData _spacing;

  List<Named<EdgeInsets>> get allInsets => [
        xxxs.named('xxxs'),
        xxs.named('xxs'),
        xs.named('xs'),
        s.named('s'),
        m.named('m'),
        l.named('l'),
        xl.named('xl'),
        xxl.named('xxl'),
        xxxl.named('xxxl'),
      ];

  /// {@macro cda.sizes.xxxs}
  EdgeInsets get xxxs => EdgeInsets.all(_spacing.xxxs);

  /// {@macro cda.sizes.xxs}
  EdgeInsets get xxs => EdgeInsets.all(_spacing.xxs);

  /// {@macro cda.sizes.xs}
  EdgeInsets get xs => EdgeInsets.all(_spacing.xs);

  /// {@macro cda.sizes.s}
  EdgeInsets get s => EdgeInsets.all(_spacing.s);

  /// {@macro cda.sizes.m}
  EdgeInsets get m => EdgeInsets.all(_spacing.m);

  /// {@macro cda.sizes.l}
  EdgeInsets get l => EdgeInsets.all(_spacing.l);

  /// {@macro cda.sizes.xl}
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);

  /// {@macro cda.sizes.xxl}
  EdgeInsets get xxl => EdgeInsets.all(_spacing.xxl);

  /// {@macro cda.sizes.xxxl}
  EdgeInsets get xxxl => EdgeInsets.all(_spacing.xxxl);
}
