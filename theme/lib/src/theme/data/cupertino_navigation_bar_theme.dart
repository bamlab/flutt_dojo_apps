import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../utils/named.dart';
import 'sizes.dart';

/// Data class that holds every Cupertino Navigation bar theme data.
class CupertinoNavigationBarTheme extends Equatable {
  /// default constructor.
  const CupertinoNavigationBarTheme({
    required this.border,
    required this.padding,
  });

  /// Instantiate CupertinoNavigationBarTheme with `regular` data.
  CupertinoNavigationBarTheme.regular({required ThemeSizeData sizes})
      : border = const Border(),
        padding = EdgeInsetsDirectional.only(start: sizes.m, end: sizes.m);

  /// Value are:
  /// * `Border()` for `regular`
  final Border border;

  /// Value are:
  /// * `EdgeInsetsDirectional.only(start: 16, end: 16)` for `regular`
  final EdgeInsetsDirectional padding;

  @override
  List<Named<Object>> get props => [
        border.named('border'),
        padding.named('padding'),
      ];
}

class CupertinoNavigationBarThemeExtension
    extends ThemeExtension<CupertinoNavigationBarThemeExtension> {
  const CupertinoNavigationBarThemeExtension({
    required this.cupertinoNavigationBarTheme,
  });

  final CupertinoNavigationBarTheme cupertinoNavigationBarTheme;

  @override
  CupertinoNavigationBarThemeExtension copyWith({
    CupertinoNavigationBarTheme? cupertinoNavigationBarTheme,
  }) {
    return CupertinoNavigationBarThemeExtension(
      cupertinoNavigationBarTheme:
          cupertinoNavigationBarTheme ?? this.cupertinoNavigationBarTheme,
    );
  }

  @override
  CupertinoNavigationBarThemeExtension lerp(
    ThemeExtension<CupertinoNavigationBarThemeExtension>? other,
    double t,
  ) =>
      CupertinoNavigationBarThemeExtension(
        cupertinoNavigationBarTheme: CupertinoNavigationBarTheme.regular(
          sizes: const ThemeSizeData.regular(),
        ),
      );
}
