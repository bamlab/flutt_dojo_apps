import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../utils/named.dart';

/// Data class that holds every theme durations.
class ThemeDurationsData extends Equatable {
  /// default constructor.
  const ThemeDurationsData({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.s,
    required this.m,
  });

  /// Instantiate ThemeDurationData with `regular` data.
  const ThemeDurationsData.regular()
      : xxxs = const Duration(milliseconds: 100),
        xxs = const Duration(milliseconds: 200),
        xs = const Duration(milliseconds: 400),
        s = const Duration(seconds: 4),
        m = const Duration(seconds: 8);

  /// Value are:
  /// * 100 milliseconds for `regular`
  final Duration xxxs;

  /// Value are:
  /// * 200 milliseconds for `regular`
  final Duration xxs;

  /// Value are:
  /// * 400 milliseconds for `regular`
  final Duration xs;

  /// Value are:
  /// * 4 seconds for `regular`
  final Duration s;

  /// Value are:
  /// * 8 seconds for `regular`
  final Duration m;

  @override
  List<Named<Duration>> get props => [
        xxxs.named('xxxs'),
        xxs.named('xxs'),
        xs.named('xs'),
        s.named('s'),
        m.named('m'),
      ];
}

class ThemeDurationsDataExtension
    extends ThemeExtension<ThemeDurationsDataExtension> {
  const ThemeDurationsDataExtension({
    required this.durations,
  });

  final ThemeDurationsData durations;

  @override
  ThemeDurationsDataExtension copyWith({ThemeDurationsData? durations}) {
    return ThemeDurationsDataExtension(
      durations: durations ?? this.durations,
    );
  }

  @override
  ThemeDurationsDataExtension lerp(
    ThemeExtension<ThemeDurationsDataExtension>? other,
    double t,
  ) =>
      const ThemeDurationsDataExtension(
        durations: ThemeDurationsData.regular(),
      );
}
