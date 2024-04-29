import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/utils/named.dart';

/// Data class that holds every theme shadows
class ThemeBoxShadowData extends Equatable {
  /// default constructor.
  const ThemeBoxShadowData({required this.skew, required this.drop});

  // Instantiate ThemeBoxShadowData with `regular` data.
  ThemeBoxShadowData.regular()
      : skew = BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 13,
          offset: const Offset(-20, 20),
        ),
        drop = const BoxShadow(
          blurRadius: 4,
          offset: Offset(0, 1),
          color: Color.fromARGB(64, 0, 0, 0),
        );

  /// Values are:
  /// * 5 spreadRadius for `regular`
  /// * 13 blurRadius for `regular`
  /// * (-20, 20) offset for `regular`
  final BoxShadow skew;

  /// Values are:
  /// * 4 blurRadius for `regular`
  /// * (0, 1) offset for `regular`
  /// * Color.fromARGB(64, 0, 0, 0) color for `regular`
  final BoxShadow drop;

  @override
  List<Named<BoxShadow>> get props => [skew.named('skew'), drop.named('drop')];
}

class ThemeBoxShadowDataExtension
    extends ThemeExtension<ThemeBoxShadowDataExtension> {
  const ThemeBoxShadowDataExtension({
    required this.shadows,
  });

  final ThemeBoxShadowData shadows;

  @override
  ThemeExtension<ThemeBoxShadowDataExtension> copyWith({
    ThemeBoxShadowData? shadows,
  }) {
    return ThemeBoxShadowDataExtension(shadows: shadows ?? this.shadows);
  }

  @override
  ThemeExtension<ThemeBoxShadowDataExtension> lerp(
    ThemeExtension<ThemeBoxShadowDataExtension>? other,
    double t,
  ) =>
      ThemeBoxShadowDataExtension(shadows: ThemeBoxShadowData.regular());
}
