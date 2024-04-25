import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../utils/named.dart';

// Colors are named with this website:
// https://colornamer.robertcooper.me
const _white = Colors.white;
const _brownChocolate = Color(0xFF651D32);
const _whiteSmoke = Color(0xFFF5F5F5);
const _blackMetal = Color(0xFF050505);
const _blackIsBack = Color(0xFF0D131E);
const _skyCaptain = Color(0xFF252B34);
const _cruelRuby = Color(0xFFE12E40);
const _yuzuMarmalade = Color(0xFFFFD764);
const _benzolGreen = Color(0xFF00D967);
const _transparent = Colors.transparent;
const _blackBeauty = Color(0xFF25282A);
const _canonBlue = Color(0xFFA2E5FB);
const _grey = Colors.grey;

/// Data class that holds every theme colors.
class ThemeColorsData extends Equatable {
  /// default constructor.
  const ThemeColorsData({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.statusWarning,
    required this.statusSuccess,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.disable,
  }) : transparent = _transparent;

  /// Instantiate ThemeColorsData with [ThemeMode.light] data.
  const ThemeColorsData.light()
      : brightness = Brightness.light,
        primary = _brownChocolate,
        onPrimary = _white,
        background = _whiteSmoke,
        onBackground = _blackMetal,
        error = _cruelRuby,
        onError = _white,
        statusWarning = _yuzuMarmalade,
        statusSuccess = _benzolGreen,
        transparent = _transparent,
        secondary = _blackBeauty,
        onSecondary = _whiteSmoke,
        surface = _whiteSmoke,
        onSurface = _blackMetal,
        disable = _grey;

  /// Instantiate ThemeColorsData with [ThemeMode.dark] data.
  const ThemeColorsData.dark()
      : brightness = Brightness.light,
        primary = _canonBlue,
        onPrimary = _blackIsBack,
        background = _blackIsBack,
        onBackground = _whiteSmoke,
        error = _cruelRuby,
        onError = _white,
        statusWarning = _yuzuMarmalade,
        statusSuccess = _benzolGreen,
        transparent = _transparent,
        secondary = _whiteSmoke,
        onSecondary = _blackBeauty,
        surface = _skyCaptain,
        onSurface = _whiteSmoke,
        disable = _grey;

  /// The overall brightness of this color scheme.
  final Brightness brightness;

  /// The color displayed most frequently across your app’s screens and
  /// components.
  final Color primary;

  /// A color that's clearly legible when drawn on [primary].
  final Color onPrimary;

  /// A color that typically appears behind scrollable content.
  final Color background;

  /// A color that's clearly legible when drawn on [background].
  final Color onBackground;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  final Color error;

  /// A color that's clearly legible when drawn on [error].
  final Color onError;

  /// An accent color used for less prominent components in the UI, such as
  /// filter chips, while expanding the opportunity for color expression.
  final Color secondary;

  /// A color that's clearly legible when drawn on [secondary].
  final Color onSecondary;

  /// The background color for widgets like [Card].
  final Color surface;

  /// A color that's clearly legible when drawn on [surface].
  final Color onSurface;

  /// The color to use to express warning
  final Color statusWarning;

  /// The color to use to express success
  final Color statusSuccess;

  /// Completely invisible.
  final Color transparent;

  /// Color to use to express disable
  final Color disable;

  /// Color to use for [Text] over a background.
  Color get text => onBackground;

  /// [ColorScheme] generated from [ThemeColorsData].
  ColorScheme get colorsScheme => ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        background: background,
        onBackground: onBackground,
        error: error,
        onError: onError,
        secondary: secondary,
        onSecondary: onSecondary,
        surface: surface,
        onSurface: onSurface,
      );

  /// Props used in our test to link a color to its name
  @visibleForTesting
  List<Named<Object?>> get namedProps => [
        brightness.named('brightness'),
        primary.named('primary'),
        onPrimary.named('onPrimary'),
        background.named('background'),
        onBackground.named('onBackground'),
        error.named('error'),
        onError.named('onError'),
        statusWarning.named('statusWarning'),
        statusSuccess.named('statusSuccess'),
        secondary.named('secondary'),
        onSecondary.named('onSecondary'),
        surface.named('surface'),
        onSurface.named('onSurface'),
        transparent.named('transparent'),
        disable.named('disable'),
      ];

  @override
  List<Object?> get props => [
        brightness,
        primary,
        onPrimary,
        background,
        onBackground,
        error,
        onError,
        statusWarning,
        statusSuccess,
        secondary,
        onSecondary,
        surface,
        onSurface,
        transparent,
        disable,
      ];
}

/// [ThemeExtension] for theme colors providing the capability to
/// smoothly transition from a [ThemeColorsData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeColorsDataExtension
    extends ThemeExtension<ThemeColorsDataExtension> {
  /// default constructor.
  const ThemeColorsDataExtension({
    required this.colors,
  });

  /// [ThemeColorsData] which will be accessible through this theme
  /// extension
  final ThemeColorsData colors;

  @override
  ThemeColorsDataExtension copyWith({ThemeColorsData? colors}) {
    return ThemeColorsDataExtension(
      colors: colors ?? this.colors,
    );
  }

  @override
  ThemeColorsDataExtension lerp(
    ThemeExtension<ThemeColorsDataExtension>? other,
    double t,
  ) {
    final scopedOther = other as ThemeColorsDataExtension?;

    return ThemeColorsDataExtension(
      colors: ThemeColorsData(
        brightness: t < 0.5
            ? colors.brightness
            : (scopedOther?.colors.brightness ?? colors.brightness),
        primary: Color.lerp(
          colors.primary,
          scopedOther?.colors.primary,
          t,
        )!,
        onPrimary: Color.lerp(
          colors.onPrimary,
          scopedOther?.colors.onPrimary,
          t,
        )!,
        background: Color.lerp(
          colors.background,
          scopedOther?.colors.background,
          t,
        )!,
        onBackground: Color.lerp(
          colors.onBackground,
          scopedOther?.colors.onBackground,
          t,
        )!,
        error: Color.lerp(
          colors.error,
          scopedOther?.colors.error,
          t,
        )!,
        onError: Color.lerp(
          colors.onError,
          scopedOther?.colors.onError,
          t,
        )!,
        statusWarning: Color.lerp(
          colors.statusWarning,
          scopedOther?.colors.statusWarning,
          t,
        )!,
        statusSuccess: Color.lerp(
          colors.statusSuccess,
          scopedOther?.colors.statusSuccess,
          t,
        )!,
        secondary: Color.lerp(
          colors.secondary,
          scopedOther?.colors.secondary,
          t,
        )!,
        onSecondary: Color.lerp(
          colors.onSecondary,
          scopedOther?.colors.onSecondary,
          t,
        )!,
        surface: Color.lerp(
          colors.surface,
          scopedOther?.colors.surface,
          t,
        )!,
        onSurface: Color.lerp(
          colors.onSurface,
          scopedOther?.colors.onSurface,
          t,
        )!,
        disable: Color.lerp(
          colors.disable,
          scopedOther?.colors.disable,
          t,
        )!,
      ),
    );
  }
}
